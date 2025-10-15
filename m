Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564DBDC21F
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38F9DC56615;
	Wed, 15 Oct 2025 02:18:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C587C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlFYEziubwoCTHfwL1A469fgz75ezxG5hq+nKp+kvKDY0dYdWk97JgpK4+KjMdkiFs/OoUNtilZaWl/g2+x8IyB8X0FD0F/hogAcRhmIf4C1Q3mVBJBq5uwXs1fdzOwNFcvnF0flbT9h0PJPTx+nvr+raLQUmmeDlz3RA+LmARxkEOzIGs/cnTVlvxI7Fyfl9CE0B2n2PKbY+4rtFbgXkp7GMh8WHmMQYVxko/JnJ9K8uoi8Hc/S+9OQSWilWqV1FwyZNymoJXCJYLd1cDVG+QXuF5Ajydxr8+tYeeddHF2FRt52sOz4E2n2U0Mt3yEKwyJ26VZwR266e5nQpkClOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkKDl0/9+BpgXOAlU3vrDU+wqswG28aHTNBtqlPEGtg=;
 b=Yra5hYyASoa1YnyKDZrlX/os8tlIrCsD3jstjvmxvED4S/de/xUbFQnHc5dgDe+UtndLdcZeO+X4brwu0xpH6LykDg38kA1+5rDhoaDBZgPgG0eI6SjW08aVXus2gUToe+H8RYE9lacSMHfnCSKzUH4EPw392mkW5Q9ow3BlI/tjS9E9futIk+IU+MfiWaaINIUZvTgOCv9ZXfZyLxk/W8yonTRPek8Mbu5csvqW+j9dfMB1rqVawtle6UW1C2R33Z0UAa/Kze84s/2WUutc0NpUXzMRqNk4EJqdEqzttbkTf2jx+UX37PVQek4n4lR3IYmogcR1Jc6rL+SFW2qwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkKDl0/9+BpgXOAlU3vrDU+wqswG28aHTNBtqlPEGtg=;
 b=f5OAjepBJz3rKNezMXVkbmVmk40CB0DOXN/SzXKwSlT+6IsVmitlZvpZKnO/7shvGhyvaAcCM3qKljeEoKNR5g/kwAI328rFHx/xPW+jEKlKF4fTokK5/4DpbRLNizRXiktRhqLA4kibkfkFyUL2QMsITwQDwnNp3PEn7rJB5RdVi0mrRsFU5J7QsPmegZba4c1yIfCnMseBbe1ysqZ+hnXW/SD+UhmXB8sNJGQcDjfuqEmaHJUIq0bS48tfPlsoapM8D5YTqDlyQm79M99FaZ1X5b4+LYnmnDhJhd7GGy02/XkfcSl90IuTNu39q5OzQSsAT2QopLKUH4EhKaAvjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:26 +0800
Message-Id: <20251015-imx-rproc-v2-1-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eda09f8-5c63-40fc-5206-08de0b91198b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXpLbUZ0a0xZR2tvV0czMlJnUS94YW9RdjA2WFpFcGthWlcxaERGY3hwR1N6?=
 =?utf-8?B?MzNVMGhleUZYR08raVEwcW16c2t4ODI3TCtjK25CTzlMRHQzTS9xZE5PeFlC?=
 =?utf-8?B?VDgrbW1KSDlncGorNmpZbDQ3TVhEQXRIRXlJWjZCNk5hQzVPMG5IbDNacHlo?=
 =?utf-8?B?V0I2Yjl1NHZnKzFXRWwrUE4zS1IyeUVSbGE3QytnTlBZMDFOVHRCOWhOQ2o3?=
 =?utf-8?B?akZBYnNobDZqdWNkNCtabnp0OU5rRk0wZFdjcXIydDlUcE5oR2tXM3MrQW5C?=
 =?utf-8?B?OG5KZmp0ck9LaUFIaGQ0ZGV4VHVtSUZXUit1MVgwSDd5THphTHNoNjQwVU5K?=
 =?utf-8?B?V3p1OGJ3Nm1CN0hoUURmcVE3a1JsbWZVUURVU2ZiVXVTOFU2Si9GYlZNVngy?=
 =?utf-8?B?SVRuNVpMWUtRUnBDck9uMWtuamV4V1N6Y0UxallXbjVpQ3Q4VTR4Q1I1TXd4?=
 =?utf-8?B?bW96K0x3WHFiQW9Kd3BZRExHdEtKOHdTM0JGRFZpZ1hkanR3K0FZd3J2M2xV?=
 =?utf-8?B?OTJtMFhwbW5tOHl3VjZKZUdhME9ZUzl6cTkxSEhsY2dxUlEzV240N3VJMTIw?=
 =?utf-8?B?bHBiWVBBNXdjbWhoQjd6aWRwaEtvZjlSbmdCNDdYMW1IU2NqTVpKSmZaTjJv?=
 =?utf-8?B?RW43ZzlxbUNxcStKNTFEeDVLNzB6UUM5ZElWS2thMFBsbFFPZHQ4YTdBYVgv?=
 =?utf-8?B?UmdtY01vSVFBODFQVlFhS3NMSFpYd3FrMDY1Q0VsbnZEVHNpMEZTYnArcVZj?=
 =?utf-8?B?WmZyRXRPREFiNnZza21ibktMVkJUS3drWktwYnM0Uld0M1FSRG5YTlJ4b2Fu?=
 =?utf-8?B?RW0wazY4MkxVSVh1YW9uRkJWdmI5OWZ5UUlzSkZqQmdxK0kzY096WDduSG1Z?=
 =?utf-8?B?cmlXSnUzZHhweWgrdUErTWFleVpwSi94R01OQkhlWlpYY2h6bHlHSU80elNr?=
 =?utf-8?B?K3lwUTd6ZHJGVTNZN09QRVhxa0FFL254K3FMZFgwZ0dkUllYeFNkeHVtVUow?=
 =?utf-8?B?WWhBdGovWk91RmFnc3h2T09Od2o3UmxWL1AwQjV5OVNXYUVqc01CMFdsb3FV?=
 =?utf-8?B?c09LRHZmUlpPUDFINEF1ZnJMLzJOME5lRFl2ejk4VTMxZnBVUkQ1aXpqTG5E?=
 =?utf-8?B?WVNsTHBXZG1IUktkQUt3QkxZaHdyN3I4ODY1YUdlU1VNUFBhYytvMWQzeGVz?=
 =?utf-8?B?UDl0L2NweHlqVFc2UkQ5REdxdlF0QzkxNDZqRlFibkVaWDRvWERCK1Qwc0Qy?=
 =?utf-8?B?K0Z5b3MzbHdWK2JNaXVhb29tYmVlUUhOUTg1TUpmNmhndWNGeEZUQW82Smc0?=
 =?utf-8?B?UTY4MmhIdjdHRXZjZHhqTXVpcnV4blhRaGU4RCtuMzJvaHNVQ2xjb1hsRFAv?=
 =?utf-8?B?SWRGL0REazRQaVRDNDdnK1NyS2lJcGEzV2lxWWNNbmswWkt5Yk5rV2QwbkVV?=
 =?utf-8?B?RDRwRFQ1Q2dsSkF6MGV6cWRNdGtJZGs3d1M5ZDFzdUZoVCtIN2ltaHNkUlFz?=
 =?utf-8?B?Mmg5Wm1kNzlVbXFBY0toN084RERMTXY4ZmJ0bEpFZjFvcm9zZG92ZGhTQ0Ni?=
 =?utf-8?B?Q2p3V20xQkw2S1QxZXBVOElZOUl3RFlqSHlVL0kvQzlDUjRVRHFsRkkza1RC?=
 =?utf-8?B?djNoTldqTU5ySEthVkFJK0IrWWZ4djJhSTVnY2Q1UlYxNHZGcjJDRGRKUEo2?=
 =?utf-8?B?enpoVjdiTk1xSUI3QkFyOGRoUFQvbnNQUGlvZmg0MTd0SWlyenZSV0FPbHhS?=
 =?utf-8?B?T2xMc3c1VGRYempSTG1qNEVEZG9yUDh3cEMxTnpkR3NFYlp3VmF3dWhsRkJz?=
 =?utf-8?B?VTVDNVBrQURzam55Z3hMdVZYWm5TTWdDY1pPWUd6cEpkWDQwM29BLzROclFJ?=
 =?utf-8?B?NDJuNXFXVTUva1VTMHdacjZLVENxVGY4MS9ac0U0dVEzZ2xvTlBqSjRMYWJV?=
 =?utf-8?B?b1gxeVhJTFlyZGVrYW1Da2l5ZDJkaElvQWhkVU5EeU92aUE0R0JHZDBzT0xh?=
 =?utf-8?B?Qnd2OFJMQjB4RmEvUW5OdXN4UW5DSVBmcUoxUXVKL2JvMzA4QnB3ZHJVbVBE?=
 =?utf-8?Q?zqpHdS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVAvSEtvU0haVXBnMU1aNFZkQjZyeHludWtXdDJhTDZiU0hwbTlESGdCWXZp?=
 =?utf-8?B?UXlvaDJaL0dpUVc0c2pWVUN3d1lMVys1dHRZQWI4ZlJ3eTJYR2FwdzlTbUJ0?=
 =?utf-8?B?cGhTaTBOQWxiQ1JzNFRFb21MZ000WjFsYURKb0I5eVF1MXBGZjVTRnhTSG9F?=
 =?utf-8?B?bVRJUGpnaUd2L29wMU1zZkpwZ053LytaTnpLdlNWbVpxKzREeWZuU1JoeGVY?=
 =?utf-8?B?WnE2cmZoUmg0b2RTRVVuZVEvUXhQbFBQaGFxTlRpdDg3eXZOLzYxQzViVFNX?=
 =?utf-8?B?aVN4a3IzT2dlV3pPN2FpZ0JyQ3J6aEtGbjZUR1NnZzVSZ1orakhJV2ZtSWda?=
 =?utf-8?B?UW5saCtSMDN0L3pTMmhmcTh2c3Y4MG9VNmQ1TDZwVUx0RFk1NkRvZlBUM2Iw?=
 =?utf-8?B?QjBlcGxyM0tTY2NIdzcxWWNDNzRpK2ZRSThqYWYxYTVVYUJNbm1SN3VNTlBo?=
 =?utf-8?B?ck5LK1NqdDgzSm41N3Vtd0R3Q3BhWE1FYVFHczFHSmZaYkhyNDhxTEw0K1pO?=
 =?utf-8?B?VDYwci80REJJT3E2KzVmZ29qTHpVeFpWQVNNZFcrTkRYYllxcThmRklhR09K?=
 =?utf-8?B?SG9CU1FtbTFmWHdwVzU5d21Gb3NoOC9JekluSWlzdjVpY2ZITWdsanc2NUEw?=
 =?utf-8?B?RUVWMzZhZjNDUWszc2poQUtoM3V6bk9OdG4yQzAvYkI0MGVJc3NNZmE0R3NU?=
 =?utf-8?B?L2dsYWxiMjR2ZHlqSGoyMnIrWE4rOThOa2dMNVEzQ3RQZ1RsZW1NV3drVHBN?=
 =?utf-8?B?YVlySG50Vmp2V0V5dE1RTld3dU9DOFR2Syt2U014RUVaUG5lMVBlOVRkdzgw?=
 =?utf-8?B?aEc0cktlK3A1eHRXUUt5bmNRM3VQb3RFTndHZE5KM3NjVkZJeXdXNndaSkwy?=
 =?utf-8?B?SmQ5SlAxR05UNzhZdjU3Z3hVbTdUTTg4RkQ4RVRMRURsRUNnNjBPYzBicUJ1?=
 =?utf-8?B?djZvNFlLb2V3MGpId3haMXp1NXNnZ3VQMUI5b0E0V3JqVXpodHJsY1RqQm4v?=
 =?utf-8?B?Y0xkcUU3a2EvcnNKcTZqUFdBckZLWGkvdjFqYThwNUhzKyt3WW5Ed3poSHB4?=
 =?utf-8?B?S216MHJySGc1VWxtUm1Dei9TNlJESkJZRkxKYjc4SFAydUxHa3pNL3htTlVu?=
 =?utf-8?B?YjZ0d01yemM4RU5jcDZhZmhTN2dlZ0krV09Hd3FTcXhHTklqYU1ueXlDRUcw?=
 =?utf-8?B?VDdHQ05SaS9wcUVCVXhSN1E1d1ZCMGpxbmtrbmhHN2Z4ZzlEZEd6TzBnZ2NQ?=
 =?utf-8?B?Mm0ydWtWVjJSZTNkWVQrbS9CdkdoM1p2SVp4QU81ZlFmWDlpTjVFYTkyS0pa?=
 =?utf-8?B?Yzdac2lNNFFVM3FLZ2tkZmlpV1RmV2p5enVVS3hJUUFGQ2l6TDFUQU82dis1?=
 =?utf-8?B?ZkVQS1o2YTJrdjFsUHYyOXRIVWJvaStoK1I3RDNUd0Y4NFRGTmw0Y0pzd1ox?=
 =?utf-8?B?YmJYbFl1bXkvblp1UUpEVmh2QU43RS9qMkZqV3dXdUF1QlBEVXRnTkpBTDVr?=
 =?utf-8?B?SmJMYThObW9wVmZEZ2NUTGRjTXRMTDdUdC9OSXpseGVCbFRLUkJkVlN2K1RO?=
 =?utf-8?B?QnQ3aHl3SXpWOEM4ajlzaXczR0lYMUhBU3BFUlhsODJMV0NyOWwzTy9YQUNp?=
 =?utf-8?B?bk1ZdFFXQUVGVWFZT1hCN2xjQWoyODFsOFZpOWVaUHZYYTJtL1B0b1lRN3ht?=
 =?utf-8?B?TXJrWjlycXNvMktNZklqNDNNZ0dMSDBiNE5ON0pGVCtjY21IaEM4am9iRUs3?=
 =?utf-8?B?LzBrWmQwRG9DeVd5SHcxc2txSERnV1RHYTV6RHZFQTYxWkhQbmVIcTNXSU95?=
 =?utf-8?B?L0txRUhhc0FCUVZrbnZnY2ZJQWMwaEl6NVZRcG5ZOExLR1QzbFd0dkhTbGVG?=
 =?utf-8?B?cFBGdzljYTl2a1p5NVM1cFBsRG12b1JCbFp0RVowNUhvK0s1Q3RoWEJWVUI5?=
 =?utf-8?B?ZDgxNm1SbHRNMStLa09OMzJqNnUyaUYrUkhzdDA3TWdXWEpIeklHcFpqNUEy?=
 =?utf-8?B?YWNVWXBKNUNiejZhVXJxcXlwdFUyNWduQlc3VGZwVTNqSzBJbVNHMUNBeDJS?=
 =?utf-8?B?QzlLV0M2WTJRNVVxaDBGOElEc0VmODhvRERPU1FLbHBmWHJrVlVveVpDeDRo?=
 =?utf-8?Q?plQLycCNaRkq/4/NZRG5yK/5s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eda09f8-5c63-40fc-5206-08de0b91198b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:16.2432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PY13ewflkJwLaIAoJ6D22P6IV0b85t7TB3lB5v7BqXAcvoJkyvpIRXAWbKuoWHUExSkDS1fZ1wsyHGSMIXc2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 01/10] remoteproc: Extend device_to_virt
 with a is_iomem parameter
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

From: Peng Fan <peng.fan@nxp.com>

Some areas needs to be initialized by using memcpy_toio and memset_io.
Following Linux Kernel commit: 40df0a91b2a5 ("remoteproc: add is_iomem to
da_to_va"), add this to U-Boot.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/renesas_apmu.c     |  3 +-
 drivers/remoteproc/rproc-elf-loader.c | 93 ++++++++++++++++++++++++-----------
 drivers/remoteproc/sandbox_testproc.c |  3 +-
 drivers/remoteproc/stm32_copro.c      |  3 +-
 drivers/remoteproc/ti_k3_dsp_rproc.c  |  2 +-
 drivers/remoteproc/ti_k3_r5f_rproc.c  |  2 +-
 include/remoteproc.h                  |  3 +-
 7 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/drivers/remoteproc/renesas_apmu.c b/drivers/remoteproc/renesas_apmu.c
index 1a50cd3289bc40de23f23630f2b591fba2241dbb..91586a99e0dacaff7d9cb5ecd1ea6e4489659521 100644
--- a/drivers/remoteproc/renesas_apmu.c
+++ b/drivers/remoteproc/renesas_apmu.c
@@ -170,11 +170,12 @@ static int renesas_apmu_rproc_init(struct udevice *dev)
  * @dev:	corresponding remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  *
  * Return: converted virtual address
  */
 static void *renesas_apmu_rproc_device_to_virt(struct udevice *dev, ulong da,
-					       ulong size)
+					       ulong size, bool *is_iomem)
 {
 	/*
 	 * The Cortex R52 and A76 share the same address space,
diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index 0b3941b7798d3971cbe982d3c3d080a717fcef65..f904424ca49edb5c81f1016d8fedaf4aa8121ef1 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ * Copyright 2025 NXP
  */
 #include <cpu_func.h>
 #include <dm.h>
@@ -9,6 +10,7 @@
 #include <mapmem.h>
 #include <remoteproc.h>
 #include <asm/cache.h>
+#include <asm/io.h>
 #include <dm/device_compat.h>
 #include <linux/compat.h>
 #include <linux/printk.h>
@@ -181,27 +183,38 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr, ulong size)
 	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
 		void *dst = (void *)(uintptr_t)phdr->p_paddr;
 		void *src = (void *)addr + phdr->p_offset;
+		bool is_iomem = false;
 		ulong dst_addr;
 
-		if (phdr->p_type != PT_LOAD)
+		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
 			continue;
 
 		if (ops->device_to_virt)
 			dst = ops->device_to_virt(dev, (ulong)dst,
-						  phdr->p_memsz);
+						  phdr->p_memsz, &is_iomem);
 
 		dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
 			i, dst, phdr->p_filesz);
-		if (phdr->p_filesz)
-			memcpy(dst, src, phdr->p_filesz);
-		if (phdr->p_filesz != phdr->p_memsz)
-			memset(dst + phdr->p_filesz, 0x00,
-			       phdr->p_memsz - phdr->p_filesz);
+		if (phdr->p_filesz) {
+			if (is_iomem)
+				memcpy_toio(dst, src, phdr->p_filesz);
+			else
+				memcpy(dst, src, phdr->p_filesz);
+		}
+		if (phdr->p_filesz != phdr->p_memsz) {
+			if (is_iomem)
+				memset_io(dst + phdr->p_filesz, 0x00,
+					  phdr->p_memsz - phdr->p_filesz);
+			else
+				memset(dst + phdr->p_filesz, 0x00,
+				       phdr->p_memsz - phdr->p_filesz);
+		}
 		dst_addr = map_to_sysmem(dst);
-		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-			    roundup(dst_addr + phdr->p_filesz,
-				    ARCH_DMA_MINALIGN) -
-			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+				    roundup(dst_addr + phdr->p_filesz,
+				    ARCH_DMA_MINALIGN) - rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return 0;
@@ -230,6 +243,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 		memsz = phdr->p_memsz;
 		filesz = phdr->p_filesz;
 		offset = phdr->p_offset;
+		bool is_iomem = false;
 
 		if (phdr->p_type != PT_LOAD)
 			continue;
@@ -239,7 +253,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 
 		ptr = (void *)(uintptr_t)da;
 		if (ops->device_to_virt) {
-			ptr = ops->device_to_virt(dev, da, phdr->p_memsz);
+			ptr = ops->device_to_virt(dev, da, phdr->p_memsz, &is_iomem);
 			if (!ptr) {
 				dev_err(dev, "bad da 0x%llx mem 0x%llx\n", da,
 					memsz);
@@ -248,14 +262,24 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 			}
 		}
 
-		if (filesz)
-			memcpy(ptr, (void *)addr + offset, filesz);
-		if (filesz != memsz)
-			memset(ptr + filesz, 0x00, memsz - filesz);
+		if (filesz) {
+			if (is_iomem)
+				memcpy_toio(ptr, (void *)addr + offset, filesz);
+			else
+				memcpy(ptr, (void *)addr + offset, filesz);
+		}
+		if (filesz != memsz) {
+			if (is_iomem)
+				memset_io(ptr + filesz, 0x00, memsz - filesz);
+			else
+				memset(ptr + filesz, 0x00, memsz - filesz);
+		}
 
-		flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
-			    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
-			    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
+				    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
+				    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return ret;
@@ -381,6 +405,7 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	Elf32_Shdr *shdr;
 	void *src, *dst;
 	ulong dst_addr;
+	bool is_iomem = false;
 
 	shdr = rproc_elf32_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -394,18 +419,23 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+			    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
+			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+	}
+
 	dst_addr = map_to_sysmem(dst);
-	flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-		    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
-		    rounddown(dst_addr, ARCH_DMA_MINALIGN));
 
 	return 0;
 }
@@ -490,6 +520,7 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	const struct dm_rproc_ops *ops;
 	Elf64_Shdr *shdr;
 	void *src, *dst;
+	bool is_iomem = false;
 
 	shdr = rproc_elf64_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -503,18 +534,22 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
-	flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
-		    roundup((unsigned long)dst + *rsc_size,
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+			    roundup((unsigned long)dst + *rsc_size,
 			    ARCH_DMA_MINALIGN) -
-		    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+	}
 
 	return 0;
 }
diff --git a/drivers/remoteproc/sandbox_testproc.c b/drivers/remoteproc/sandbox_testproc.c
index ad575a7c10fdb399c77f4f01b8167a8ae71574a2..7ed38e8656c5f8d653e4aa32316a3cf7dbd7a767 100644
--- a/drivers/remoteproc/sandbox_testproc.c
+++ b/drivers/remoteproc/sandbox_testproc.c
@@ -308,10 +308,11 @@ static int sandbox_testproc_ping(struct udevice *dev)
  * @dev:	device to operate upon
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *sandbox_testproc_device_to_virt(struct udevice *dev, ulong da,
-					     ulong size)
+					     ulong size, bool *is_iomem)
 {
 	u64 paddr;
 
diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index f45da9a68ac6eaeef0c5a563785a2b9433430b7e..bf721e78bb36f52ee55a776dc7b6b45a89858fbd 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -61,10 +61,11 @@ static int stm32_copro_probe(struct udevice *dev)
  * @dev:	corresponding STM32 remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
-					ulong size)
+					ulong size, bool *is_iomem)
 {
 	fdt32_t in_addr = cpu_to_be32(da), end_addr;
 	u64 paddr;
diff --git a/drivers/remoteproc/ti_k3_dsp_rproc.c b/drivers/remoteproc/ti_k3_dsp_rproc.c
index 5a7d63772830cf064e28042ebb6726f058cb8876..9275e1b241de7f13ddda08b27288cc32d7d95725 100644
--- a/drivers/remoteproc/ti_k3_dsp_rproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_rproc.c
@@ -261,7 +261,7 @@ static int k3_dsp_reset(struct udevice *dev)
 	return 0;
 }
 
-static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len)
+static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len, bool *is_iomem)
 {
 	struct k3_dsp_privdata *dsp = dev_get_priv(dev);
 	phys_addr_t bus_addr, dev_addr;
diff --git a/drivers/remoteproc/ti_k3_r5f_rproc.c b/drivers/remoteproc/ti_k3_r5f_rproc.c
index 48401bc6eb67b0d0bf673b8db033f9165353e495..c738607c10925c33d6f5a614d8ada2da0c5ecb2e 100644
--- a/drivers/remoteproc/ti_k3_r5f_rproc.c
+++ b/drivers/remoteproc/ti_k3_r5f_rproc.c
@@ -534,7 +534,7 @@ proc_release:
 	return ret;
 }
 
-static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size)
+static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
 {
 	struct k3_r5f_core *core = dev_get_priv(dev);
 	void __iomem *va = NULL;
diff --git a/include/remoteproc.h b/include/remoteproc.h
index 6f8068e14967571eea18522b70fa272697610a41..9adc3d17d8f773b0c01f3952fcc846fad7337861 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -495,9 +495,10 @@ struct dm_rproc_ops {
 	 * @dev:	Remote proc device
 	 * @da:		Device address
 	 * @size:	Size of the memory region @da is pointing to
+	 * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
 	 * @return virtual address.
 	 */
-	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size);
+	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size, bool *is_iomem);
 	int (*add_res)(struct udevice *dev,
 		       struct rproc_mem_entry *mapping);
 	void * (*alloc_mem)(struct udevice *dev, unsigned long len,

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
