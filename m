Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CABD7E4E
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BCEC2870B;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7362C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxYKnejmVG1oYjF5nftKu6hCO5yGWVUmUCJdo4FhopthjtvmosYxtZhR+7XPjo4LNwhqlIOlq8RyOvLIe6vKO6XTfx5RZTCyaingekp2NJjNkVFYPfGsBVr4oafjJWmbq3gdhW2y4fHNrJes7Lb+5BtYpgt/6YwEZl8CSLR913GNw5On6qOMKXAOjh+i+cI9gDjELiJJyUVJZrmOijMYAkFjz86Vodvqn0a0yzjEhPsBzwZhJei0R+H/ZHeudwkgDd59U0hsq7e4mPcvxB/f4pR5Cyp8Rd6csbL/08dQqCasry2DBHPVlW1jetiAIkv13ZgwWYbT8f5nkfS8bbwzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrhAPk6xI+8yvRXTg4RVDWn4zfAGYhJ+zRzOedme3ss=;
 b=LrciQZALy0WiuGvEIypMhxCPZ8AFPE+BzICBoK0CThGpZnRcYS57LBwMtSz5AZgntfmqoYaTqMh6BG/3Sz/wxraW2Z6ptSRVIKc3lIfZCTP+lBoXAxj/Jv0FDvSiWAXLXNcSL2AJ8rBPifOsrN7nOGP/FDZrpCm6smfS5wecKS7MePsnmyev6uCpUF5Jsr2JE1lMPu5V2UmeL7iMWrlk2uCaqZQgztSD10+aNefkG/a00mOio3/2pUsP9Ecf3uz1CIWHRxwwJGj5amdGLn+H3Sxnm5b612xsq5gSqXUL5dtG9iUWmzriDVSfBTEWsdZmmnjnRBzItjjpxi8uFMEDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrhAPk6xI+8yvRXTg4RVDWn4zfAGYhJ+zRzOedme3ss=;
 b=wvQBZ01X7OXVxSnaE272JABvHVWfuUM4P3EqGAJoevCSrDQ2SSIEqvtjOT6fhF4YFKZD1CoELqsY45yRvkLax0kwS8tj0SSoV3sg7H6OsOpCjbTTJb6U6Qth+K9RKKSQ0VHEdsszZReXZ8YiOe3BNYFdnd2IG+2x39o47tcAfKR+dywnPSB6WgDGLuOxtx/gdtkOMJwtDcbv8xf5FG0yincMxvfxsz8Lcfmz3WJYvA1sCXV3quOaPyWzluNFEmPXTprEZS0jIZEm2ouvQxycBEn6ORbzyCQUBBoYCGgyAsTJ/zb7M2hg3n5O1tKDQDLgF0xdRHUq6cl1mrQEzyeZxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:22 +0800
Message-Id: <20251013-imx-rproc-v1-3-fb43a3fafcd0@nxp.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c6ea3c-5e74-46e9-fe64-08de09f90ea9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0NQOGdibHZTVjdGMUhwWXB0c1dEaU5JYVV2WGU4dzRPNUgxWUhYOWxGcFdM?=
 =?utf-8?B?WG5XUSt5cG16OEVhT0NiRTVJL3pNbWlzZ0dpWDNjRHBIRWU1dFYwNkJhUS82?=
 =?utf-8?B?YlI2Y2Z1NEZOa1I2enh0QUZqeGsrOFhtU1Z2NGNCMm45b0hyK0RKNWlmaXVQ?=
 =?utf-8?B?T2VhckU2OUFoL0pFYXJjNFA1NW5ySWJaS21TOTdSQ0JDQjdEd2k5YXIzZzlE?=
 =?utf-8?B?M1pxbjI3WUdvMnpEVGtxajVqRjE0Skx5NDdaYzVMODJaTUxtMXJHUEtnZlZj?=
 =?utf-8?B?WDdkbDloU096d0l6N2hsbTQ3NUNOdFZLNnh1VVkzVmN2cWhJUUp4QVJkUHEx?=
 =?utf-8?B?L2VtTTh4UU1XQ1JTdHpGdE9lU0R5Wm14QmNJaC8rZlZiTTVpTnRoYkdickNG?=
 =?utf-8?B?SEdobEJVa2h5UTJNVWhsbkVQeG9pUFpCeGlYT1FPSzVSUTRFS3MxcVJVYlR4?=
 =?utf-8?B?UEtPRFA1c3JEU2RvcUUyQUFnRFNaYVpOQ0dvcmh3dlRUeTF4aXJIRUxCaDk3?=
 =?utf-8?B?UGs3Yms2cXFpV0VpSXE4aDhmUTY3NzVOZTBnREFKaDZzZlJhaHRXL2VmNmpx?=
 =?utf-8?B?REJLekNqZmNlclRGRWdGeGNhMW4vY3l4OWpjZlRCWFBpUGNjUlZFSGZBN1Fo?=
 =?utf-8?B?UDNkY0Q2VThYZlJBQmNvTTVOenNsK2RzOHQ1LzlJUUpRVFRzdzFTbUpPMWJW?=
 =?utf-8?B?Y0R0eTE0TGF1YyszcmU3M1ZqQ2RuZTFrUUkwaXp2YlJGcitpVzlGemhtODBz?=
 =?utf-8?B?dmdZa0t1SWpVcGIvOXFYcEtsdndOR1JuTXp3aVYya1NlWkhQeFpHNDU1OFFU?=
 =?utf-8?B?R2dFOVBUd0lPSXArMXZzN3UwbnNrWWdwTGcvclFpdW1icTlSd2h1SUhCaUJw?=
 =?utf-8?B?ZDlVeE81U3hrL2hEL0ZlVUh0L0N3cnE5T2RKU1JCN3RDT0NiSkFrV1ZGUXpy?=
 =?utf-8?B?YW8wYzB0cFNhWkpVVXF4cEVTNzNtQjJhUGVaTHpDd0JVOGkvZ002VENoYWtQ?=
 =?utf-8?B?bmhCUjVCYkFQbWNpazFkTlZkTVBza2ZmSDExRndhdlVMczRYMDJQcjZZdUhv?=
 =?utf-8?B?N3Rtdnk3NzMzbjlvdkNzRzdvOWltcldjNVhCYndYbVRrNEFYZEdWY0tKaU1w?=
 =?utf-8?B?d0lrMVVzY3cvSVRaVG1EczAxTFhhS2JxUnB4ZGV3bVRGa2VOajJyZ3NidHl2?=
 =?utf-8?B?T3VXZVQ4OS9NWGlXa2dzazVhckprV3cwUTR0MytVVjR1WlI0a3JWSk5NMWpE?=
 =?utf-8?B?UURhNTdqbFl0cHU3L3NDOHh5a0toczR1RE1oWExLSDJkMTZsRi9VTHhaN0xn?=
 =?utf-8?B?dUtMK0hWa0w5WnJwblRqb0VwdHJzN0VVNkZ2clB4MGRLWldhVlVMZzVIQ2h2?=
 =?utf-8?B?VUxBL3pvWm1xeGlCdktzbXFJM2ppMUx3emZWQjNlcHdXSi9nM2RzVDJ0bnRz?=
 =?utf-8?B?bDZZb1ZKUWlTYlVkdHJmWGREOFdPOFpCdGNQUHExOThIUVViY0pqcEZ4UVRh?=
 =?utf-8?B?eDFuSmM3VnV1ZHpHbkYxYU5ndzhkaFlTMktYN0VyRXd6b2xyKzFmR25VVTVp?=
 =?utf-8?B?c3R0Sm0yaHNqbGlXbjZDdnBuVklLK3RkL0wySjNNRHdhUFhGcUJudXBLMU8x?=
 =?utf-8?B?dmZQWXEwd3c5aFQrekRLcjFYSGNzSndaZWZZcUR2U0RleWtKbUsyZ2NRdW8z?=
 =?utf-8?B?cnZyU3ZGRnBSZ0RwbE8zV2tLUkpNUzNucElEdjNQS1AwUjNLMzBCbWxQL0NP?=
 =?utf-8?B?ZFJQTWhWeUxDUnJaR0RaZ21oUjJTL0xHZjhpdE1xQW5GQUpoOWM5ekQ1YUpR?=
 =?utf-8?B?WTI1eFluTTgwMDZQVjZTWDNqWHBQOTYxWTkvWmVKZ1JMd1JQZDdhd3NNbzVT?=
 =?utf-8?B?OTdkMllvYWJhTE1ORVBLVlA2cG5PS2FiTnN6bGd3NHRxTmtUWFRkbDBLU0kr?=
 =?utf-8?B?MFIrelVxVzgzeWxLQXh0Wkg1cUI4d3NXQ2lTVVdmdzB0WS8zazNtQzYxKzJk?=
 =?utf-8?B?Q2RLL2JOc3hBK2JLNjRIY1JkSTZIS2JUVUtPYUNnT003OVMwQ0l2VUlpMDVM?=
 =?utf-8?Q?ccucE3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDhoL1BIakZ5a0dhcUd6Zzh4UXdXdXBITDQ2YlFBYjBMNlRtU3I2a0VOY0RH?=
 =?utf-8?B?U1dsQzVPVzNOeUVrWmZtT05ZY2thVGptWG5tSDlDYk9VM0Vqa1g4Tk90MGIx?=
 =?utf-8?B?UFRZSlhyMnZtK2M4RWVwd2lwZnVxQjc4VVdFRWpaanFQckhnNTRuQVpabW10?=
 =?utf-8?B?N2ZvY0gvdUFsRXNpU05zaGozT0xtWm85WnFNbTV4NmFGTHgwNGt2QzRUUitM?=
 =?utf-8?B?NzZKOVU1VDN6R3hVWDNRQ1RiK3p1T0JRSmZiK1pBejZMUVJRRmx4SFFWVXZW?=
 =?utf-8?B?aTBBYm5VSHlJalhobS82M2MzVzEzNTZQNnBGSWI3cVRYZTVXSXZDeEJKOFNt?=
 =?utf-8?B?OGxFNGV3WVgyU0Z4NlVlYVhiQTFmWTAxczNDbkVyT1JBUlE2YTl2NWpIV2lw?=
 =?utf-8?B?Z2ZsajBGY2lCK0RqWXlOamE5REVUNlJlQ1hwbHh3RklBRHZLTGlIcEdGWGNO?=
 =?utf-8?B?WXp4akxLN0NlVnpvL2JOb2RxZFAzZGxVK2ZGYkd3T2t0YlJXeXMvYmJrMG1X?=
 =?utf-8?B?SHpkcUFEbUM2c0JwWXI5dytpKzFBNXVWKzRsSXl6SGxvQTYydUM0MjVEREdu?=
 =?utf-8?B?WTc1cms2OWlZWEg4dk1mckFQVXRsTEJxb1IyNVBudndKMWtHTjFTUTQzdXhZ?=
 =?utf-8?B?ekg2eWZIc0hsbmZsT1RDR0RyV2NVK1dpdDRrTVJiZGZMeGdIb3NHTWgyeUlv?=
 =?utf-8?B?VWlFYTZhcWtCd3FTcHdsa0NtZXQzU2hJMGNIQVJrVGROaS9VNVBZR2dzNnFV?=
 =?utf-8?B?bXVGeTUydG5oaXhCZWRlSm55b2tGKzFRQms5QU5RM2wxcWdMREhmYXRzNkJa?=
 =?utf-8?B?N2NlbmRuWHg5TkVKNktVRnd6TmpvaWVHZmFvZ2pYWE9Fc2YxeURycDdXNnY1?=
 =?utf-8?B?VG9DVktpeitzVEU0aEVlbUY5WVFhaFZVSlN6N0orUWJJRHZkVXhrRWhWL2JY?=
 =?utf-8?B?YUVvL3A4TVB1ZUUyWUdmQUpCYkNZUUFuM2JWaEdOai9WUmEzdi9URGNRQkFB?=
 =?utf-8?B?c2dGSGw2UWQ4Q3RIYkZZS1ZvTFpkQnlzbHpFcmowSWtDeFNxalVPcm1YaUt4?=
 =?utf-8?B?YU12NFBYeGcwRG8vWTZjMFdCMkFYeFd0dnh1VzROVWN4UmpFeUxleUZGcEdD?=
 =?utf-8?B?emJud2RJdlYvcjFXaWJTRUtDVnRFZlJDSnYvY28xd1FKckd6Ui85S3RwZDZo?=
 =?utf-8?B?R3MvYngvbHdNOXh3MnU1Q3I4Y1BIWjZ4T0N5M2lCd3dWd3dZTU8zLytFMm9Z?=
 =?utf-8?B?VzlWbTJoK2w2cnl3R0sxUjNyWTJjb1pQS2J4dkZKSURTWTFJZVA0MFpmWjlR?=
 =?utf-8?B?OUtqc1VvT2llcS92eS9OdXdjSzB6N3prV2dQQXdGYUVZdTVlbUEwaHp6aVlt?=
 =?utf-8?B?YXdkdUhsTUF6OXFuajV2OUIyd3o1akxmUlRvUXRlK2daa0doQ1BYUEw3Z0ts?=
 =?utf-8?B?VWcwZ2d0SS9CcE1QN21NNTVzYUU3QmQvZ2hQQzB6REh5c3lzZ1FpNElicTZJ?=
 =?utf-8?B?K3Q3QWhTT01EU3p3WWRxQVNKS0phRzVrWEFIaG1UcERmZHVIY1lGTHF5L0NK?=
 =?utf-8?B?QnBnQktNRUJpdTFMd3V3dDdiUThSN0JTRGhrTWxVTHJybTVuY1dSMHB6bmhM?=
 =?utf-8?B?ZjFaRldOSm50bEoyWEpLVUQ1d2JIWXFjTGNUT2ZEaElOWW1DY2V2TXkwSUNY?=
 =?utf-8?B?aVgzZ3diN20yYmVFUU4ySS85T242UWpJUWtsdUVtTjVjbHExVkU1dThsbjh5?=
 =?utf-8?B?Y2J4ZmUrNGFMeVBrMEt3ZEdWNFI4ZXlaMXQ4bHR6SGlMMUVmaTQ3TGdrdENP?=
 =?utf-8?B?c1Fpc0JpUTJCZ0l5ZVhTdnR1U0JlTnRObE5BWXVIcXN0eHJtNFhDU3ZsdUJ6?=
 =?utf-8?B?OXBlZXptU1A2S2h0dTB6dTVXRnBwaU9wY2VEZVdJYThrV3o1RTVQWHpLWitj?=
 =?utf-8?B?NHpjOTNIS1Z3MmcwQlpXdWVsM2tiaHp2VVVISGc5UzJxT2VTeHRPb0Zhb1RX?=
 =?utf-8?B?b0RRUm0wNnlGVUY0SExyL3NjUWhRZXVjbVlybVNjVXdzUW9SVnJzQmRrRFBz?=
 =?utf-8?B?RzB6K3ZKMisyd2lud0cxdXpseHZMTHRIbEZWUTI1RU1nYXN3YnRnOEZSOW4z?=
 =?utf-8?Q?MTAROaHYngDQDaNNx7yMgRVgd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c6ea3c-5e74-46e9-fe64-08de09f90ea9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:23.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pn01pS/zpuqdlmhpWr4BZJJzh2GvoZRy8KGTtnE33KqM3YMjzj+ZlsXe+cbHblF//UJQ0Uhocjrl67Kd2HtdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 03/11] remoteproc: Add imx_rproc driver to
 support NXP i.MX8MP/N
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

Support i.MX8MP/N with start/stop/device_to_virt/is_running/load
implemented. The device static configuration is mostly reused from
Linux Kernel with adapation to U-Boot dm_rproc_ops.
The booting method:
 - load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_DDR_rpmsg_lite_str_echo_
   rtos.elf
 - rproc load 0 0x90000000 ${filesize}
 - rproc start 0

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |   1 +
 drivers/remoteproc/Kconfig     |   7 ++
 drivers/remoteproc/Makefile    |   1 +
 drivers/remoteproc/imx_rproc.c | 233 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |  56 ++++++++++
 5 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 671903605d17a78b88d83ddb7e01b78115b553e7..9070df85335919ab2db73bb0668869d64051f964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -319,6 +319,7 @@ F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
+F:	drivers/remoteproc/imx*
 F:	drivers/serial/serial_mxc.c
 F:	include/imx_container.h
 
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e9f19a694332bf255c0144467264193873dd6384..8056f210abc895ee0e4866679090cc47cce9e7ae 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -33,6 +33,13 @@ config REMOTEPROC_ADI_SC5XX
 	  Say 'y' here to add support for loading code onto SHARC cores in
 	  an ADSP-SC5xx SoC from Analog Devices
 
+config REMOTEPROC_IMX
+	bool "Support for NXP i.MX remoteproc"
+	select REMOTEPROC
+	depends on DM && MACH_IMX && OF_CONTROL
+	help
+	  Say 'y' here to add support for i.MX remoteproc.
+
 config REMOTEPROC_RENESAS_APMU
 	bool "Support for Renesas R-Car Gen4 APMU start of CR52 processor"
 	select REMOTEPROC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 47bd57c7890d9b14cc53da59616ed59ea2eba47b..7ea8023c50bb8ca34cd142260a9cafa8040c5560 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_$(PHASE_)REMOTEPROC) += rproc-uclass.o rproc-elf-loader.o
 # Remote proc drivers - Please keep this list alphabetically sorted.
 obj-$(CONFIG_K3_SYSTEM_CONTROLLER) += k3_system_controller.o
 obj-$(CONFIG_REMOTEPROC_ADI_SC5XX) += adi_sc5xx_rproc.o
+obj-$(CONFIG_REMOTEPROC_IMX) += imx_rproc.o
 obj-$(CONFIG_REMOTEPROC_RENESAS_APMU) += renesas_apmu.o
 obj-$(CONFIG_REMOTEPROC_SANDBOX) += sandbox_testproc.o
 obj-$(CONFIG_REMOTEPROC_STM32_COPRO) += stm32_copro.o
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <asm/io.h>
+#include <dm.h>
+#include <errno.h>
+#include <dm/device_compat.h>
+#include <linux/arm-smccc.h>
+#include <linux/types.h>
+#include <remoteproc.h>
+
+#include "imx_rproc.h"
+
+#define IMX_RPROC_MEM_MAX		32
+
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
+struct imx_rproc {
+	const struct imx_rproc_dcfg	*dcfg;
+};
+
+/* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
+/* M4 own area. Can be mapped at probe */
+#define ATT_OWN         BIT(31)
+#define ATT_IOMEM       BIT(30)
+
+static int imx_rproc_arm_smc_start(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_rproc_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->start(dev);
+	if (ret)
+		dev_err(dev, "Failed to enable remote core!\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_stop(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
+static int imx_rproc_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->stop(dev);
+	if (ret)
+		dev_err(dev, "Failed to stop remote core\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_is_running(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return 0;
+
+	return 1;
+}
+
+static int imx_rproc_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->is_running)
+		return 0;
+
+	return dcfg->ops->is_running(dev);
+}
+
+static int imx_rproc_init(struct udevice *dev)
+{
+	return 0;
+}
+
+static int imx_rproc_da_to_sys(struct udevice *dev, u64 da, size_t len, u64 *sys, bool *is_iomem)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int i;
+
+	/* parse address translation table */
+	for (i = 0; i < dcfg->att_size; i++) {
+		const struct imx_rproc_att *att = &dcfg->att[i];
+
+		if (da >= att->da && da + len < att->da + att->size) {
+			unsigned int offset = da - att->da;
+
+			*sys = att->sa + offset;
+
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "Translation failed: da = 0x%llx len = 0x%zx\n", da, len);
+
+	return -ENOENT;
+}
+
+static void *imx_rproc_device_to_virt(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
+{
+	u64 sys;
+
+	if (imx_rproc_da_to_sys(dev, da, size, &sys, is_iomem))
+		return NULL;
+
+	dev_dbg(dev, "da = 0x%lx len = 0x%lx sys = 0x%llx\n", da, size, sys);
+
+	return phys_to_virt(sys);
+}
+
+static int imx_rproc_load(struct udevice *dev, ulong addr, ulong size)
+{
+	return rproc_elf_load_image(dev, addr, size);
+}
+
+static const struct dm_rproc_ops imx_rproc_ops = {
+	.init = imx_rproc_init,
+	.start = imx_rproc_start,
+	.stop = imx_rproc_stop,
+	.load = imx_rproc_load,
+	.device_to_virt = imx_rproc_device_to_virt,
+	.is_running = imx_rproc_is_running,
+};
+
+static int imx_rproc_probe(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	struct imx_rproc_dcfg *dcfg = (struct imx_rproc_dcfg *)dev_get_driver_data(dev);
+	ofnode node;
+
+	node = dev_ofnode(dev);
+
+	priv->dcfg = dcfg;
+
+	return 0;
+}
+
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.is_running	= imx_rproc_arm_smc_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
+};
+
+static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{}
+};
+
+U_BOOT_DRIVER(imx_rproc) = {
+	.name = "imx_rproc",
+	.of_match = imx_rproc_ids,
+	.id = UCLASS_REMOTEPROC,
+	.ops = &imx_rproc_ops,
+	.probe = imx_rproc_probe,
+	.priv_auto = sizeof(struct imx_rproc),
+};
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a82dc4a195b44cd4b2d5ce5767c2688dde69ac7
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ * Copyright 2021 NXP
+ */
+
+#ifndef _IMX_RPROC_H
+#define _IMX_RPROC_H
+
+/* address translation table */
+struct imx_rproc_att {
+	u32 da;	/* device address (From Cortex M4 view)*/
+	u32 sa;	/* system bus address */
+	u32 size; /* size of reg range */
+	int flags;
+};
+
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+	/* Through System Control Unit API */
+	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
+};
+
+/* dcfg flags */
+#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+
+struct imx_rproc_plat_ops {
+	int (*start)(struct udevice *dev);
+	int (*stop)(struct udevice *dev);
+	int (*is_running)(struct udevice *dev);
+};
+
+struct imx_rproc_dcfg {
+	u32				src_reg;
+	u32				src_mask;
+	u32				src_start;
+	u32				src_stop;
+	u32				gpr_reg;
+	u32				gpr_wait;
+	const struct imx_rproc_att	*att;
+	size_t				att_size;
+	enum imx_rproc_method		method;
+	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
+};
+
+#endif /* _IMX_RPROC_H */

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
