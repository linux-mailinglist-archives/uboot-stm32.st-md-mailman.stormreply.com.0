Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86232C306A8
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25ED8C62ED6;
	Tue,  4 Nov 2025 10:06:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F029C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWm22JQn99JN1+4AxUSgz2JP06oYKC937q197r94aRETcCTcRGw8HyIRUAAiw5WoqssoFqBRDOmF93/FbNJ3GC73BR54g7rJtJeDg+9RtKqKBmFsIJimJbT5M9FKQ1PV2OB+UedEsDSsVSOizGXJLeJCb69CbWr5nPyqHiC497nkmgxr1FtzBsKDJS56vXx3Xq2AonlmyTl9Gtw+gdJyrgvyYkURWfDkqKTFPnlVJHZrIIsr2xSISIOUqHploXnPA26X71yUzOvf59EcImYvNbO0FGoymYzLJB6lo8kpx4y2LboT69JMxHN2w6ecVM11NZ2rSlA4Z/MGFW8yfFZZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q9Lgp7s0o6y3AJQNTpBS5pO1m2WcQivlvAohBXVQRs=;
 b=Y//Ef9hhPaEQTvV4Zy5cyvcsGZjIuPUW5tduePuu5Gn9v3SSAEaeSAaT/wu9TsYUilym2z0G3TGncPyUBEfsvzSG4mTXKXX4z7AQAVAiA3VBKFsfjcYRRSRAN0RWolweb2EtBMxF9oeWw32d1sma59youVBWB0t29tq5Cl2SqKNmgE/kRa0gL9vbLx9l7El9dYOeNV1Ac+DMs/Ojeo8VDIX+2bDK0lvC5JF7QKYHWpr8yOzAs7o7ghyc24rriRSmcjZzKA7jjwdHrK+w2bzHLff7lFwbDOh+5B+ELP/CLLd+dQEKVVnCVrMpToqMRl9QGHxHVBrBrozr21MrbnkJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q9Lgp7s0o6y3AJQNTpBS5pO1m2WcQivlvAohBXVQRs=;
 b=Due5bzLJJEjcQT3vQHG7AEJaK9x7EAA5A1dOVG7MA4vgE2gbh4DID2pp3a476s5dBZFGrhgCArtJFxM1KiAofCzdb+/wattFHaDp2IhhLYw1ivW+lz9/zfFKNl3WBAXX7z4C44XvvTZgDL6Zc26djUN5B22lhmTz7h2iHJbyit1fQhNXmPiiqyX3cmtZrwfL0CwBLQdh5O22JoiuZ9KwGBNTFiZ9CAET5gMdbquXU6RMrbQ2LZ+uPsSYnNtgqP33CqVAWfpRkQYKXcCHqOzOYBrKt9CRM4UCqXqI2myM5PqvuJKp4QXcE5YhSGid2M0T17r6XeJfWDvH6ILH92aPug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:40 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:54 +0800
Message-Id: <20251104-imx-rproc-v4-v4-5-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=1963;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=h+N2NEJapn3FzYp5kMru/5FeC7RZ78w6kPMaHhHMC5I=;
 b=EXpSOec+AI/cqGdre9aNMoANFJn0waE8XgcGWWwFgfieyDGQj7lMMVQkDDm9V32YacdtEOHRI
 FXTYkRo5eugB9PHpCi13jk5CK7+BBdCTicCzBM9Jdz+wF8dXVN616ij
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1e48f2-76a7-4bb5-7046-08de1b89d90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkJMQ3lUbVNsL1drMDQ5Y1lDbFlpZ3ZNeGRmYTUzMkkwdGRTK0g2SnZYM3gy?=
 =?utf-8?B?U0RpcmIvdWpCL1AyYzJ4RHJYQUxHUG93a3o3dEFrenJpN3dQNmtJRjNrd3Ev?=
 =?utf-8?B?RStwS3llQ0M4SXJQem1JZXJHT0NXMFhzZHhsU3NLRXRkaDlwRjB2NnltN2tO?=
 =?utf-8?B?RXRvUFYxZE9IY0VaWWpmZ3FkTldhTkZ4VE1VTzcrakw1dzh2TkRDc2k4NllG?=
 =?utf-8?B?NmxCbHdwd1ppY09WdTUxNmF2TlZGVk5WeWIrSVlpMXl1OEFTRWpMMmd3aWt2?=
 =?utf-8?B?UkhDQlV4YWExZGRlWm9UZ2ZpWG43ZUtSQldhQ0hoNkhWM2pWdXE0TTI0dXBh?=
 =?utf-8?B?UkEvWTFNY3hBVnoyczNFL0VIeGZEZUtZWmtEVGQ4SGZieTFvZnRzTFdTN0Nz?=
 =?utf-8?B?d0NTd0xMRUtTTmZiTUVaUHZ6UFhiK0pMbXdIRkp1ZnVnbW1CSE5yWmRDWmp5?=
 =?utf-8?B?emp1K3hQVENnZ3JHcEVnKzF4TnZwVTN5TUJDWEo3VGc3d09LVG4yaFp3NnJv?=
 =?utf-8?B?YW9ndC8rZHd6a1JhVDVydXdKNUFmZEVPQkpTRGRBd1JMQS9zNXVtLzZBdjA4?=
 =?utf-8?B?YTA4aUNlUGtPLzhwMFg2VmlyckN3WSs0b0Y1dkw5OGpaay9MVzYxMllqSGYz?=
 =?utf-8?B?YUxLMHlKV0xiVmZ4SG1yMC93QWhMRVZCc1VsK1BaSUIycE9tc3VIcGwwbkp4?=
 =?utf-8?B?MEdKck1JWkhKL0ZDc0lTSUV5NHk1V3RwNDBaMjhvRVQyNGROc3E5ZldvdXhv?=
 =?utf-8?B?ckpWL2JjMlRiYVhKMDVSZWpuNzJHSUt2VDlLcVVqazk2b25nUTJSSWFid2pX?=
 =?utf-8?B?NUdJci8wVC8xcVcrdk9SeFkvcENEOUNGZUV2RkRrMnFjYWg5M1R0ckxrc0dT?=
 =?utf-8?B?cnBHb0ZoTlhvdTg3MUFlVXFXTGY1N0NvMTBmQlZaRnlxVVV6dEQyWndyZ3Yv?=
 =?utf-8?B?MzhaQWFPYUQ3TXF0NkNrQWJwTUloSXlpYmd1YVF6TDRKUzcxQWhjR0UwU2hQ?=
 =?utf-8?B?end2QVE5ZkV5a0dpYVhjT25CQkwxbzArR0pNLytFVEdWSHYxanl4aFFXQkZY?=
 =?utf-8?B?OW4zVGRXSG5TdlRybk5Fc28vSDhkcUpzNnJId05aNEwwdXJPWTUrZngrOC9U?=
 =?utf-8?B?TXRlZUFGK01OK2Vsb3BLU3llbTQzZU9PYks5akVadE1IYWxCMklTaytNMnFZ?=
 =?utf-8?B?Z2w0V3RTRzh1aHdHc2p0S29ESVM3N0d1bkdqelE0QWRaRGRackMrOHVBYzNp?=
 =?utf-8?B?T3g5R2N0cHpHd25FVWFTUzlyK05Jd1ZJc3FKZmY1dGlTSEMzYXpwNVF3YlFi?=
 =?utf-8?B?MWJzWEN5VGJVL2owSTdHbUM4Sm1KMkEybGxDZ2cyZW9iR3FjeG9LUTlNOUE0?=
 =?utf-8?B?VG00Q21kOC9JNnR4VXUrQVVVTWtGNUNMNXZoRzFxNUVndjk4UStWZUx2ZUpz?=
 =?utf-8?B?ZFYrTnNMek91Z2w0S0JDUHlHdEYzcUdNOEhNTTBQcUsxM3lSVHhFY2hKRys1?=
 =?utf-8?B?YzBzWEFpei9XckdqWlIyR1hGQU5rdGtsQkhab056YTBRdiszT2VxMGZGUksy?=
 =?utf-8?B?MjEwQ01zU1AzeW0vSmFDMGZlVjlGS1Jxdk01aUNLenljUjBmRDR3VmQ1TlQy?=
 =?utf-8?B?WWdKTG05a2FjbktNMmM4dEtCRzVyZUpWZWJRUGxXcXVLTVhjaTY1YkV1OW5v?=
 =?utf-8?B?UHJEVG5TbFh5cVhxb3BkUDR5WjhZazRTRS9CbEZEZEVQeWh2VHdYRkMvejdk?=
 =?utf-8?B?MjUwdVBmV3RVWTRhR1FzNE5MVThNM2c0NWpYQ0JwbnFYc1JCU2k2RnBUZVpq?=
 =?utf-8?B?YmMzRzA3ZGJuY1pmaEE3RjlZckFUVXBlVHZGM1RsQURsLzFycWhvcVlDK25y?=
 =?utf-8?B?Ky9QamFqaVdaREtuTXhtUE9SdzNSU2Y0b3pzbkxXRVlqQTFkKytjYy9zbFVz?=
 =?utf-8?B?Um5FeFJsWDhXdUtCbW1ubGt5VDhaaVVtL25sQnFQc3NPdkNxSG1jRXBtN2c1?=
 =?utf-8?B?bkJ1djljYlk1MEpCYVZKWHVDN2lhamRmZDgwLzNGcVdQREQ3SkJSaTJ6K3lM?=
 =?utf-8?Q?/WEDna?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dBQUxrdFpHVFcxTUtqN2hVV0hPMzkrVnVwUHFwR1FzckEvd1luYzhLM094?=
 =?utf-8?B?WUx1NjhjWFdjSmN0WlJnQWRUVndncVowMEpFRnhpQmdOWFp3QlJHUiswWjRn?=
 =?utf-8?B?K3VDU2doNXB1Y2JwLzNzMWtGTGtFdEQ1MUNUMjFid2ExZ3k4TFFHdHAvcjI0?=
 =?utf-8?B?cjlWZ1owa3NQbGJ5R3NwejRHbGhyeTRkNzNCZ2hVV3hSa2tyd2ZXNmFDUzBX?=
 =?utf-8?B?SHVMemdtZzl1eUd3c2ZVWVByeitRKzBIRVZ2WVl1OGczeXlqKzVPRkZoYkpG?=
 =?utf-8?B?R29lSFJQSVBaUDJETWhUd252ak0wRUlSQTJwRU80VEFRM1hQN1FtdU12T1Qy?=
 =?utf-8?B?aThqM2w5QS9zUU1tOUV2eXRJdDhITjZ4cWJvM0E2S3dDUEhUZTg3aHdVeG9m?=
 =?utf-8?B?M2RQSW5FTVAyM0FKN0w1V09BOFh5SUx3eFdjbmJPYlBPUm9MMEFSNDhkSTIv?=
 =?utf-8?B?V2NQRGV5QjBKcHdTbncwZWJtRTVYVWd6V3lyMjlXUnAraFFRdzlkWEs5UFNT?=
 =?utf-8?B?aU9DYktFNzR0SnhKYzZlelE2elh3OU1MR1lBMTBwVDQ3MTFrSVM2bFNqbytF?=
 =?utf-8?B?cENIZEp6Szc4MW8veHZRVDV2K3RPbHJjRWNzdHI5d2t5bDc2YVdvU2dXdWdP?=
 =?utf-8?B?dkNQSlozTG81VmxUc2J0R2ZLaGl6Z05FaGNFUHBZejJGazhrcTdpd0pCRXQv?=
 =?utf-8?B?ODJyam9lVk40V2Y1Z3Fuc0RoWm9SNlJ6Z1B2QWp2djlXdVRqSkp0d1hUUWFv?=
 =?utf-8?B?ZmxxL204R3YxdUZEMDlwNFBOWDk1djFNVHFSWFU2MEdFNU9GTUZnWFBhajY2?=
 =?utf-8?B?K0psa0ZRZjFWZkRYTm1BVmx2Y3IyelpkcFRjelk2VkpWNHFyc2lvNmplZXJ3?=
 =?utf-8?B?QmM2MWhoK0drTFQ4Z1VaQk0zZnA5MW9Sb3ArLzNqSXYvanFHVTJmV1RMN2xC?=
 =?utf-8?B?MUdId2l6QlJuZWgydERFRU9tQWIwYmdYSExETVhmVWtROXNkMVBOQ0FQbEdr?=
 =?utf-8?B?VXFKMVN4eU9reWg2SHFtMjhlRit0MklZU2ZaMmQ0STNqZ0RYb1d1L0RUUDF6?=
 =?utf-8?B?VFMxUG1OU0I4TGlFWWFhbUFoRVZtMlNtRk5oSGxHQlNPdUllNUVkRWJMc3B6?=
 =?utf-8?B?Tkc0dnNZWmVsVEJlSDRJZm56RFpRcUlnT2dtWHlLMTlONWFzV0EreWU2WXh0?=
 =?utf-8?B?TWs5YnEzVy9GQWV2VEhQZHNDRGR1TkJaUDVTZ0xuSy92dGRjUkRacHAwZHY5?=
 =?utf-8?B?R1JkT2ZjeFZGWjViTEs5bnRJbVVQdzZqMUg5OU5CYUp2TGo2a2lwWkZwam1o?=
 =?utf-8?B?M0RTdmVYcyt4QnFSd0Q3aUZMN3RydER4eEhzb0ptVlJucHBERGo2SE4yM29t?=
 =?utf-8?B?SUV5VnY1cjdHdTlGbUNGMmhLYWp6RmJZZkJXZVlGTjZpWFFzcVFuQVVhT3l6?=
 =?utf-8?B?Y0h6Ri9ZT1N2NVlHdncxcExKdXROYnk5WTdPUkZZUWJEd3FoTDFKVi9vNmFL?=
 =?utf-8?B?a2xZemx4M3BteXJ3VElnZWk4SmhwanBBbjYxc0lIVjNkT1Z3N3dvdDhrRHFY?=
 =?utf-8?B?Qlp6cWY2SnN5MnFONm4wb0RzZVQxcmxjSWFmSWo2Y05ib2ZpNjdPNldnRTJ0?=
 =?utf-8?B?YXk2dmlaMk9nRSt4Q1ZPTlF5RWxuOFMycXZ2YWF0MVhXSXJhaHNoYUh3dGZG?=
 =?utf-8?B?LzdOTDZ1a2JiQnFtZnRjWU40SG9TenZVaGY3ZHMyNXUwWWZnRENKNm1vVmI0?=
 =?utf-8?B?Y1JFZzR3Rkw4RytPTUR3VFVTNkFkamxsTGhtVHNvaDdBa3BHRkNMRDkreW1V?=
 =?utf-8?B?YlNsYUVROU0xSWZzU0U1MlQ5eHhNVVRjQUNlbmxFcS9UR01BMVlTbVYxOHR4?=
 =?utf-8?B?WXU5dDRPN0VtL250aGhSaWNzZWh0c0lENXhwcFJsTzFvNFl0TkUveGhVWENx?=
 =?utf-8?B?eVFnWXdVZEhIMjI0V3NkbTBISVROZHd4SGF3Wk05QTFlbG5iL2lJVHY0TUlj?=
 =?utf-8?B?MEZYWUdzUldxOWwxTXNmL0J4ekNnV2xuU0o3aFEvRzBVdExZb3A4NnJUb2tq?=
 =?utf-8?B?NlJHZGR6MTNqYThVV3FZbXBwOGVUVHYrTXc0bFNzOWVZYUlpcHlrdnE0L2lZ?=
 =?utf-8?Q?xGYgG05D3P4MaPiY6lGKmrs8C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1e48f2-76a7-4bb5-7046-08de1b89d90f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:40.1274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kf9sJaCJ5dKc09qSgaDOky4N7/g7F7Cc7Vddel0+BmIqGpBUYoXTx9gfwJviBwXQAjBNBla+7dLW6wNRI9n4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 05/12] arm: dts: imx8m: Add remoteproc node
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

Add CM7/4 nodes for i.MX8MQ/M/N/P.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/dts/imx8mm-u-boot.dtsi b/arch/arm/dts/imx8mm-u-boot.dtsi
index eb5b95a1fda7c37f8911bf1732d20ee9ede4c198..d891e8062fe557d6855f07078918b56e23e4c053 100644
--- a/arch/arm/dts/imx8mm-u-boot.dtsi
+++ b/arch/arm/dts/imx8mm-u-boot.dtsi
@@ -15,6 +15,10 @@
 		};
 	};
 #endif
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		syscon = <&src>;
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mn-u-boot.dtsi b/arch/arm/dts/imx8mn-u-boot.dtsi
index 4a4498b36b012eb7aa22a3feeb043013068e961f..29eecd6d70d9f6c9fef48cda9fb560841ebd4aa0 100644
--- a/arch/arm/dts/imx8mn-u-boot.dtsi
+++ b/arch/arm/dts/imx8mn-u-boot.dtsi
@@ -16,6 +16,10 @@
 	};
 #endif
 
+	imx8mn-cm7 {
+		compatible = "fsl,imx8mn-cm7";
+	};
+
 	wdt-reboot {
 		compatible = "wdt-reboot";
 		wdt = <&wdog1>;
diff --git a/arch/arm/dts/imx8mp-u-boot.dtsi b/arch/arm/dts/imx8mp-u-boot.dtsi
index 9ede98a11e42f6279d654443bbb2d7059ad53d81..d9d220c70db600a7be1d021a0c4e8927a2f2b17f 100644
--- a/arch/arm/dts/imx8mp-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-u-boot.dtsi
@@ -16,6 +16,10 @@
 		};
 	};
 #endif
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mq-u-boot.dtsi b/arch/arm/dts/imx8mq-u-boot.dtsi
index 93e2ef27f7ced9b3a471e1dc41be4b1861ed0b81..0687fcdbd68b210aa9cfb89e87713e9a5aff0754 100644
--- a/arch/arm/dts/imx8mq-u-boot.dtsi
+++ b/arch/arm/dts/imx8mq-u-boot.dtsi
@@ -7,6 +7,10 @@
 	binman: binman {
 	};
 
+	imx8mq-cm4 {
+		compatible = "fsl,imx8mq-cm4";
+		syscon = <&src>;
+	};
 };
 
 &soc {

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
