Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3346BF986B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42270C5E2C3;
	Wed, 22 Oct 2025 00:49:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF8A5C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1V3K2aQMBwiNL9A3Vn5tcUm1lhLx8qXNumx85JE5KitBoXusrLLjxYfFSkgZ4yTHNVAbBPEcLzchsgeWaYSdhscDWFPkoMohaBnYoGb85ury2SPL467Dxreu24P0icREj921hgexK0VmEtWh0MexflYIfL5j9rlYhxMFdwxMi8AZA9AONFwXO44dQrtaSyIrHQS3TmIqAc46fzr/YJzf6ynOMwxkaGlvPdYd+FmTYwBiILrch008DN1VVAlzeYN7rvT1Fp25swjzKLfz/LPrQyZz/90Owb0LA8g4VT1e1uCYaH42INcRdh3LEoHt+PA/gNpprCyiIYsSH/XtOnyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6l8Osjz3ralyyhGaM9nvYKxzXuf7EjZfROpaMpc0uk=;
 b=D1J+/HLS/K6f+B+7BJTvfjGeWGJu5MymmYlpTJjQ/DrCTB1lLvF0Urknf+GnvjeREm+lwiAMmSFyeIKkP5n5UAWo+lBcjtIWGXR3bLq2SlfxBhKynPAW35oN1D56jPYI79agDY4eY4O9EsKQWOurGw0CAqXpxBehDQahpXtcskh+K7pxJ0T71/C5NFpKj2fqFIxq0oXZyNQTlEK61F6xyt2BFygY+PPRmGDk8HN7ivN8D0j7PjqWLARlLYVVD3CixV9UDCBlwDabMbiZl0E3ceFJ0iWD5O+6lGfteTLnwxqV6dnFj+Xto5aMTVC387CA6MNgS6AsmUKTi38wsVL7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6l8Osjz3ralyyhGaM9nvYKxzXuf7EjZfROpaMpc0uk=;
 b=U0PD/Kqipa7sAwwGWtLW7pUuv/eXcPE1K6FL44pFI0C8gZ77UIxh3ImVdpVVXiOy62pwUtR43W/9DJNlgVdTRbQ4WM+EcNRrwx2DCO71k9cSCM7dmftRNoakTPi9++JQ5p0kkxZGijmBZGrCurtjWczgXNTCmpz4xF3+6y/0KaSPjf5iBUl4UanW0MYtl8myf2N5KVQBjj4zKB+OzxSmNN0nVQSsu9ndpl07/tE8gbPLFhl/XABOa0qJ7tqJU5EEv4D6v45ZbHymfpG1bBAmubPY6Fhvb2jr2AZOOjeGEeHbIkjdw2TuFqORuKY9/8uVw6p6cpika9iwuGWHJkL5iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:44 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:36 +0800
Message-Id: <20251022-imx-rproc-v3-v3-10-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=1284;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ANtkamVd84cbxygH0RG3gtlUypCuf+CUFkSUM3bAQ6g=;
 b=yMPre9GdVbyPUMu9Lp1XEAW1Om470oVoN/AzjawCLh1TrJNsNQyu4yuG6QqBuStPbnSxtsr82
 vZGaj169L5xAGnJWUOiPNeVpiLqhw4lwb9LnfmmyUkdBvLzkOerEung
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 57906f35-e2a5-4520-8d4d-08de1104e484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzJ3cnRhazNoZXVOSVdvNmtUMmU2U3ZobDdPclNzTWFCSUJqRndLL25wRU1J?=
 =?utf-8?B?anN1aHpRMWFyWDBDZ0JQWWhTR3kzdk1saUF0bHdaTzRYY1d6dDRxQ3RSSkp1?=
 =?utf-8?B?Uk1UNFJkaWhUNE1GWnpwbXdrcVdwME5oalNDREZjVHJjOE4wTVNPTzRVRmNG?=
 =?utf-8?B?emxzdFRRc0JPN285MFhId3UrNzNIYkNYRk15K1YxNDViS2wwbE01SXA3ZVpG?=
 =?utf-8?B?dVVZczU3a2tHYzRvY2t4MkJSdURDRHoxSFU4OTVJZ2RBRy9sd0VsMHQ0QjNu?=
 =?utf-8?B?MGlLUnhBcE9RRzFRUW52azl0alU0ZnpWeEZKa3JXcTZwWndVYy9NaHBjRENG?=
 =?utf-8?B?bTRHcWk4N3F1ZEtBY3JzZENlR0xDaWI1QnppZXFaejl0NE1PTnpSSEt4Y25T?=
 =?utf-8?B?ZFJRbmpEYmdlZ2huc1ZtOVJlU0orRm1jdWZsYmk4UG5YK0VKWTN5TzFaQXBH?=
 =?utf-8?B?REl5QlBiOFpGWlZCbzhSRnVXOUxQTC9BZlVyNlYraXdFSHpqS2c1MVFGSE5w?=
 =?utf-8?B?bjRCSjdZeDg0SEZPdGw3d05pYTNXQUpyS0lhWkhRQ0RWU2lMRGhCYmFFUmNW?=
 =?utf-8?B?WnRpdXByOWtRNkFDYzVidXBOZXpGelB3Sksrc1dDRzltUVdVanhOd1QrU2Fk?=
 =?utf-8?B?MnBjcGJuYWRrTEpxM1hEQ1U5c1Jqbk9Gajg3cFBiblRHSWV0Z2FTRGZOTTNB?=
 =?utf-8?B?L25BeXhYWG1pUzEwdUJFRWpaWVBpQXVLR3JnUHZtTWlCTzZpWmFKcThGQVFS?=
 =?utf-8?B?R2R5U3RhbzlaL1d4U0F6Y3NwbVBHeVB0NUl2RFBSc1lUdDBlM01DK3kxdlg5?=
 =?utf-8?B?RWd2Y2M1NU83U1ZnVHBDQi9IWFhLM1daL2VqNzdZT3pnRndpT05sNVdYQnho?=
 =?utf-8?B?TERGUWxVZnYyajErNUhqalFZcXA5WlVDbEhOT0J5WUQ2R1RmaTl4UVJzbGo1?=
 =?utf-8?B?eDJmRnZDa2dmOHdWT1k3Y3NnaGRtWWptTlFCOHpWVjBFT2hhZlc2bEtVNVJl?=
 =?utf-8?B?SUdYZGpENW5QZ3NpQjRkeEZQLzd5emJXUDFzMU5DSERBNEhnUjNmZFIxanIw?=
 =?utf-8?B?cEFQNGxGOGc0TVFiUHEzcko0Q3NWZnVBNFV0N21zcXhtUUlTTUZJRVRSY1FJ?=
 =?utf-8?B?SWx3VWdPSWVneXIramllLzhFN1kzdU9BeWNjZmdvZkdHREZURmExOGVWRjdm?=
 =?utf-8?B?ckxwMzlDVTQ1ODl5MnZkTXJINkw1aHEzdXc5WWV6Tk5pUVErRHJWQVBLNjd0?=
 =?utf-8?B?VXliSkZxWTlXclBtcEhoVVU0NFYzZG8yeHBocmh5TXBYaVkzRmNSSEs1NDBH?=
 =?utf-8?B?RXMrZnI5S0c4Zk9RWlNpN3Y1WEd4UnZUenRRTWplZTdJeENHWm9DaHJVS2Vt?=
 =?utf-8?B?S1l5czkwbXhMTGloNTVRNGpBWkt5UDZVVW10TnhtWURBQjh1VHFCT0tvSHVG?=
 =?utf-8?B?SUltLzE0UzJPY0kzZEtVWkd1SWhwWm1KWFMyTkVwWHpqL2RYd1NMRnJqMkYz?=
 =?utf-8?B?NjlVVW93dFJCMDdveXpOZHdCRkVKUmducEhrS0FyT3dwQlp2Nno2aVVhbE9E?=
 =?utf-8?B?REkzZ2kxWUoxaHIzWlIwaEJMU0NZNkRyUjY3S0RyTW5McGN0T1RvV3dBa3ZK?=
 =?utf-8?B?QjZOYzgvdHViSmlyUmRSai9sVE5QcG5oQ3d1VGxhSGVaQ1dvdm1OaGpsNGNu?=
 =?utf-8?B?aXJIS28rUnlYN0JwQlVwMjlvQmFUbU1iWmhsK2xZdWgzR0FTWGRXNWg4UFJy?=
 =?utf-8?B?MVc5dWhsQ2lrdUZSRXlkYzN6M0psdUZ2Z3hEUHh5RVBhek5oVVBKUkZrekNC?=
 =?utf-8?B?d29aU2U5ZlMyR0FBVDdENWdKa3UyMjk4dTVNbGV0ZjNqT1NjVDkyQlI1U1dJ?=
 =?utf-8?B?K3NwV3ZKd2FuVHR2TWsxSkp3S1JKRWQzYVQ3TWV1R1ZrNmduR3RDZXZWUXlx?=
 =?utf-8?B?Y3BCK3BBWlNWT1doSGNzMkZnNDUvajZYbG5TRDBqREpQNFJjVndBTlc0Nyt5?=
 =?utf-8?B?c0lpU084V2lPZlVJZW43R3l2dnpoTC94WnR6YnJ0dVdKZTNLcUJpNkVmU2FN?=
 =?utf-8?Q?bw9lWT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGp1RytzRzJaS0RmYkg3WFF4ZVpBc29CVzZNRUpGYUNrVHM1TjVwWkxKZlBS?=
 =?utf-8?B?aHRTNXZNV2RZY0QvQi9TaXNWdHFSZkV0anlTTGNvZHA3MWZQSW03bmZDeHZ0?=
 =?utf-8?B?ejVsN05PQS9CbGtUOGhIa29nMVo2djE4b3VyRGV5YmdqOWlIT2FydXlBcFlv?=
 =?utf-8?B?QndpWVUxU3Z3bllmVWJjQUtxVDB3WFZxY2I2US9Nc0lzeDF0ck14OU1DU0pC?=
 =?utf-8?B?YVVleDRKUXdnV3htcEc3UjlnM1dwNTlCVVRkQ1gxWHE1b3UzV3hpMHJXT2Mx?=
 =?utf-8?B?ZFVsWHlkbjZzTVkyeml6V0wvdVgzMythL0pTV3N5YUw5Z1RNUGZSdFpZUDR5?=
 =?utf-8?B?TWVXaDVOcHNISmVWZ1dDQXdxRnhLM2hBaEJCenFuNFYvTXNQdklNemcrSmN4?=
 =?utf-8?B?ZDloMlI0VDBXNlZmZERmYzFZM2cyaUYyUG53dEVBVkpZQ3p5RmxOcHJqNW1R?=
 =?utf-8?B?ejA4MmVkZjVSU0t5Y2NFZGpNdVhXSTFWaE1DVDlaNUJWN3IybmNTNnlYRVpn?=
 =?utf-8?B?Z296Ry9lWVBtcW5jZXpxbFFMa3lFU01IV0F3NkxpbmI3a0ZyQmJWMEVkYmlI?=
 =?utf-8?B?eWF6VjIxeHZwc1hVVWxDdWVGV3c5c3Nia2tsYlhUWExtUWFWbHlORVNNU3Fi?=
 =?utf-8?B?ZENKNjAyYjIralBnRTlaenVxUnhMRlE5SVJlU0NtTDVjRm16Y0xZWTdSK255?=
 =?utf-8?B?bEd1TWNXUG1CWnhXNHdQdVVYUHJ0bHJrb2lsalgzQUJUK0hLc3BWUEx0T09V?=
 =?utf-8?B?REJVZFg1VFZ1Um54aC9sNUlDcUF1TjJqaGNXZ2JmUURQb0QvNFBPTHJmbHhW?=
 =?utf-8?B?ZnpGOFJnNUpqT1AwRC9SQTlFT3ZmN1hFUFBXNU9CeWNCYXQ0SFllQU5XS1dE?=
 =?utf-8?B?a1IreTZjU3FuVmNmeFpYTDdYQzlqQTZYMXpGUldxakhZMmNkNDMrU0JhNGJO?=
 =?utf-8?B?aDcwWVAvbHdaRUlMdENTTkliR3huamViRVBNMGtwaDN5R2NlczFQeCtQRlB3?=
 =?utf-8?B?MnpVYkNWK0pqdXkrS2txclNjaGJxRUpRRG9ZaU1MR1VwSmYwWEg5MHdZUStw?=
 =?utf-8?B?ODE1TGcxRC9YVUFaWjB4ekpTSW5JdVFvbzdrK000WCtFQWF6ZERIQXNlaWpY?=
 =?utf-8?B?TUdOQW5tREx0ZzVGblNvcFRkWjVXWUpiNnNYQ0FVdXBZcjlZaVZGRlUzakZE?=
 =?utf-8?B?eTR6Q2dJL0tENU1mNFVieUc0MVFUQm9Famw2dGVWL2NSM1dVaml2RnV5OTN4?=
 =?utf-8?B?WmswZm9lYzZnOUtWUVlsaUhmYk80akhPVzJXVk9iQUFwcVNIQnVVemRNZlN1?=
 =?utf-8?B?SUZKZm81L0NxUk8zNUNyQ1BEVUZtRk94TGE4anVYOXNEalpxNlJRUXNhdHpl?=
 =?utf-8?B?eTFmRXdjNmF1Y1gzTkk5NFJ4cWZLRmNiM1hhOFFJMHAvamo2d3Q2bndIcE1O?=
 =?utf-8?B?b0dweEcyUVVPdFdZR0JBVG4xY21RQnZTby9QNFpRTlY4Q294THFibGdpblg1?=
 =?utf-8?B?Yit0L090UHBuNzE0N1lSVzhkaDFPT1dnNGM5T2thVjQybWJ2SGs0NjNmZHRz?=
 =?utf-8?B?bXpHdE8zOFhpS2d2SU5OcG0ySGg4WW16YjR0SnpralRDMkFaSkZzRit6dUxu?=
 =?utf-8?B?OTE1Mk1sZzhqUWdsdG9yLzZoQlErcnpzNkhKUExQeHhFZm8xeXRGNFBvQk80?=
 =?utf-8?B?N2ZMNXdQTEg3dkNUWk95bFpIUXBlOVBhTzRLbzdENjQ0VkpkVkdrZDQ2ZlNI?=
 =?utf-8?B?R2lvbXk2Yk5WSTdGUVNsaEJpenljQVZWUE42VkUwS21yOC9GU1IrakhoeTVo?=
 =?utf-8?B?cGxyNEZYeWdSOGZMT0RNalBQYjk5OGhzSmFJL3NzS0s1Q0VFL0pVeTkrNm1n?=
 =?utf-8?B?Y3EzbjRZZ3ZhU2phQ3dpOGJCTnNBT2V1NW9hZHplYXJ0bHBUQlVtQlFFbTBD?=
 =?utf-8?B?QkRVeDhXaG5PRUxHRVJneFJsOGJRMXdwK2ppUzQ3ZTJFZXhpa1BwMTQ1VEt0?=
 =?utf-8?B?Y1lHUkJOZHFTNkQvOUprdG51YjNXb2g2NlkrN0ZHMVROOTE1Mm1ldkNIbHk2?=
 =?utf-8?B?MGEwMk51UnR3M3dEWUV2ekFrREhseEI5N3BlR3R0TngyZzdqbDJiMDhKRW1J?=
 =?utf-8?Q?FzPm7MGH17ndKAzOzSec3rjUB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57906f35-e2a5-4520-8d4d-08de1104e484
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:44.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od07hIgyikYvb+e5yXzMz8T6BIneKCByqtu1BN8skV9IxIMAE69w4PsI/BYT6fDM2qcbF6N/0B/0YXcErdkafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 10/12] imx93: Enable remoteproc for
	i.MX93-EVK/QSB/FRDM
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Select configs to enable remoteproc for i.MX93-EVK/QSB/FRDM

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx9/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-imx/imx9/Kconfig b/arch/arm/mach-imx/imx9/Kconfig
index 48f458fa55c0938b0219648541314b1655ffc980..7fd408815e3b62665f8cd7a0456d137385dfa444 100644
--- a/arch/arm/mach-imx/imx9/Kconfig
+++ b/arch/arm/mach-imx/imx9/Kconfig
@@ -69,6 +69,10 @@ config TARGET_IMX93_9X9_QSB
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_11X11_EVK
 	bool "imx93_11x11_evk"
@@ -77,6 +81,10 @@ config TARGET_IMX93_11X11_EVK
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_FRDM
 	bool "imx93_frdm"
@@ -85,6 +93,10 @@ config TARGET_IMX93_FRDM
 	select IMX9_LPDDR4X
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_VAR_SOM
 	bool "imx93_var_som"

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
