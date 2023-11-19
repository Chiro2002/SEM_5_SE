#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_CHILD 4 //4 way b+ tree
#define MAX_NODE 3

typedef struct Node
{
    int numKeys;            // Number of keys currently stored in the node
    int *keys;              // Array to store the keys
    union
    {
        struct Node **childNodes;   // Pointer to an array of child nodes
        FILE **dataPtr;             // Pointer to an array of data pointers (for leaf nodes)
    } ptrs;
    struct Node *parent;    // Pointer to the parent node
    int isLeaf;             // Flag indicating whether the node is a leaf (1) or an internal node (0)
} Node;

typedef struct BPTree
{
    int maxChildInt;        // Maximum number of child nodes for internal nodes
    int maxNodeLeaf;        // Maximum number of keys for leaf nodes
    Node *root;             // Pointer to the root node of the B+ tree
} BPTree;

typedef struct QueueNode
{
    Node *item;                 // Pointer to the node stored in the queue node
    struct QueueNode *next;     // Pointer to the next queue node
} QueueNode;

typedef struct Queue
{
    QueueNode *front;   // Pointer to the front (head) of the queue
    QueueNode *rear;    // Pointer to the rear (tail) of the queue
} Queue;



BPTree *createBPTree();
Node *createNode(int isLeaf);

// insert functions
void insert(BPTree *bPTree, int key, FILE *filePtr);
void insertInternal(BPTree *tree, Node *parent, int key, Node *right);
void search(BPTree *bPTree, int key);

// remove functions
void removeKey(Node *root, int x);
Node *findParent(Node *root, Node *cursor);

// display functions
void display(Node *cursor,int blanks);

// // helper functions
// void Node_constructor(Node *node);
// void BPTree_constructor(struct BPTree *tree);
// void BPTree_constructor_with_degrees(struct BPTree *tree, int degreeInternal, int degreeLeaf);
// int BPTree_getMaxIntChildLimit(struct BPTree *tree);
// int BPTree_getMaxLeafNodeLimit(struct BPTree *tree);
// Node *BPTree_getRoot(struct BPTree *tree);
// void BPTree_setRoot(struct BPTree *tree, Node *ptr);
// Node *BPTree_firstLeftNode(struct BPTree *tree, Node *cursor);
// Node **BPTree_findParent(struct BPTree *tree, Node *cursor, Node *child);
// // queue functions
// Queue *createQueue();
// void enqueue(Queue *queue, Node *item);
// Node *dequeue(Queue *queue);
// Node *front(Queue *queue);
// bool isEmpty(Queue *queue);
