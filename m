Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E5BD7E4D
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9130C3FACB;
	Tue, 14 Oct 2025 07:30:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011016.outbound.protection.outlook.com
 [40.107.130.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 528EDC36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7w+BZJtxioZdwvtq65yuhzqoLBTg82MrTQ4cOectfTIW/Sq75OPNmjE5OLw1GHR8faC/9hmdmxPV7dRW2kcs/sTWVYkZxgYQba04UKJp+XtM3ELWlfFQsumN8R+jD8Pz9k/8GLH/hiQ8WmyWmWV5PgLfTUIM52G+8Eqi+GoVuiEpWGoD9gd/118jNlCQD107r9jEiAj9c09i1JDPmya6IiH8qE2sUxstX8mb0hw4lwTbrI0D9HxC9CG1XJyqQlscZYIZkWYTkKS0hPtFFzWreSOUPAGZCK+UWJmWnLYN48qRwnZ9LtS0f+DqYgiucR6rON6i32yF7HjuYVlAr2evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tn2HHK4pK9tKQgdBPx2LLWWT+skRvCltL7WycX2/ag=;
 b=IOvKOHfOigrFn6cxGuDgajTavWuHzHPjLU2Sk6WTTMiq+zs8wCisVlAL4h5IE1hn1j1YhLqaSq2iEDUOOYZB9Mw1thOx+7Ge1zQWSJKXsDBVc4fkGvEoZxK/0RnsJ7NeykNdWaPNAvPRkbv6enjBeQK8xihQM1pKH00D0iShd2flXm/8/kRwThdAKtcXWM6yQmhW1IsIL/xxZScIKf+Ecwh/qk8ibsB6sYM6dk35EYkMk0qem/6H1V0NEncmvZr1nPtOrC0WxQ5Sf8Rfba+dJnpJZqDAh4xhVHXSiOrBoZEGOAgRwg8oSuWzPh+ZRJioFw4mzs5ufNLA7q+PyFDDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tn2HHK4pK9tKQgdBPx2LLWWT+skRvCltL7WycX2/ag=;
 b=XnuaafrpegxwTp7cHzbSNJIzZFQ2Q1fT8+gTgCqCARZLqJcW3LF3Weu4eSHK24DZzaSfUJRuuByOl/cq23Fkv4aT4+dFuytuOc2BCxj2rm4h3Ar0OyFNZp5XP50t8ww080Cdn76yO7ONJvBx8d8tqyrMVVGet1aFLL6TpvndlTZgnnb9BPoTJhqZZmQ2M5afZP52YUxRTlYuILm43ZVGhZR4AMcPLqHENuQy48XgL59cgGrMkEZ2aoubiEz2359jcG2SQmJsOGi19PKtWbfO7zjX2tTGRDtkMWRmpDxyP5MgcdotO0vYu/XOh2D26EhY+Gn7ErRU7XtbvZagqiDNjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:19 +0800
Message-Id: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
X-B4-Tracking: v=1; b=H4sIAK9o7GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mj3czcCt2igqL8ZF1jC+OUJHNTo2TjNHMloPqCotS0zAqwWdGxtbU
 A8AkSrFsAAAA=
X-Change-ID: 20251012-imx-rproc-383db752c3f7
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
X-MS-Office365-Filtering-Correlation-Id: fd023fcf-d812-426c-3f4e-08de09f9050d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pIMm5ucWdTeUlzb3I4K3JXb3liMDF2bmZhVVQ4aUZSbnJKaEpPb1lBelZP?=
 =?utf-8?B?RDVBdWl5MzRwWGx3Zk9VQ0tSL0F4ZzVPMmtsTWdRaVpZOVZ3NDA0YWsyMVRP?=
 =?utf-8?B?WXZsKzRGR0hGTjU2UnBVQVRTakRUQ0E2N0s2MkoyL3R0TjdpMWJDMDkxZGt6?=
 =?utf-8?B?TWlpWEhWbVRlVEJMVTZHZllrYUZHbU1ja0JVazA1dE01RE5YUXVWMldHZExr?=
 =?utf-8?B?TjJ5RTNrYWpMUG5JVzVzMi9jYWFoUHhYNHdqSENLYWdMenVFTDZGV2dTaUF6?=
 =?utf-8?B?SWptYXpxM0xMR1F2MGt3RXZwWGNRVWdsK3pTa252SjViL3ZMb0Y0UFJtNjRr?=
 =?utf-8?B?YTkrZDIxdW5ZYXdsTjV6bktDWlZlZUNQaHRzWkVBdFRTSmNHOW9vQnc3K09w?=
 =?utf-8?B?a1FmRXhycUtrMDZpZmZJVzY3VkhuNXJTRUlrOWhqRXJsamQ4NWh4QU1HTXo5?=
 =?utf-8?B?T3M3cUNTZUQ1WW15bytZQmNQRDdCdVdmTU1qV0FVRGVpVUt3ajZDS0M4Sm4r?=
 =?utf-8?B?MGk5R2g1Ykdka2xvL29rbzlvVDVpczJ1amV0a20vVUpHSFJHVmhTVkIrenps?=
 =?utf-8?B?ZzVucXBXYmlodGRZaGVja0t2eXQ0UVNzcEVpYUYxY3U3UWtYbHMwZXlzY2hD?=
 =?utf-8?B?ZnJPdVFkdGtGR1d6VjJrdlhpSXBWaFRhN1FpMWg5ZnhtWldmVEhIR3FST1F2?=
 =?utf-8?B?RFdpejBxZUllbkRLdXdiUDAxeklUZkNqY01rL2gxZ0N3eHFYaEl2MWRoa250?=
 =?utf-8?B?QnVKUmlzd3BLTGVEVFFLMkhVWGpkVzFwUEZRbGJXR3hRVmkwQXRSRE5qam1r?=
 =?utf-8?B?MmpYakFLdHJONXN0M0U1NHJpMXRrWXkyOWRhcGZwWHpDdy9WUkV6Q0MrZU1B?=
 =?utf-8?B?TkM4YitVQlAzMHVIbjNFc3Q0M3Y3OHgvQVloRFUvMFNMWXlEcW44eG5zdHlP?=
 =?utf-8?B?Qk9TMVFVWEJkai9VWHBRbG9ldlQ3c2lwSGoxTHZJcmJBU01PSGdJTDVNeDNp?=
 =?utf-8?B?aXRIdWN0NHNaN1JlVEFiYUUwUjVTeVpzNkREdkNrN3FoL1hLVTFMK3B4RHVt?=
 =?utf-8?B?OVNMM0RqTExwSVhNMGN5b2ZveHluYXFVbWVLR0dBcFlCWmZRTUhFZFRZMTdr?=
 =?utf-8?B?d2o4Ym9IcDBtQ2tWNTc5bHRKbDNwRlpSbzQ2MHhYV29Bd0FIajc3VGh3S0g2?=
 =?utf-8?B?aDNFZWNqUE5hdnYzL0R6N0tTWXFNQzhHREVsM0dUTm5PVzdDT2VZdDRON2FE?=
 =?utf-8?B?ckFTM2FHVXBVUlFGUFFzblJCdytCSmM0QWtFZ1ZPdVVxbDdSTmtadzVIS3Nk?=
 =?utf-8?B?Y2lJV2d4emFPczIyUXdiWlRPZlp1ZXhUcWZ3QlRwT2RNL2V1Y2VVbVFlMDNy?=
 =?utf-8?B?cThUaDlyOXhmTm1oQ04vb01MRGl5V3BMZHEreXM1THQvZWlLUHY4YktYMndH?=
 =?utf-8?B?UEhzK2ZTUDdPNUthbGJ0SWJ4RXNvcUUrMTlYcUFYN2dNM2NDaVZVeEVQVTBY?=
 =?utf-8?B?K3A5OFgrS1pReFRtN0hpZkFmYXdZdHNqWGFOczBsYU12NVJKRDdWNmVVN2t2?=
 =?utf-8?B?Z1VFeFBJZlR4MmpHRzdjcU5rS0F2akVzYXIrR2RUMXlvSCtIODNoV2M4M094?=
 =?utf-8?B?cUFUeTVZM2N6dG10T3FmVzhLNjY3RFdrdW81T084bXY4QUJHMkh5YVREMW9h?=
 =?utf-8?B?alV0QlprMTFGYlFrZHhpWHYwRzEvRDBNTmVJNkhYMllLVjNibFlyQk5UcThJ?=
 =?utf-8?B?N0VVQWFIOFRQckNvOXVrZUZRKzBUK1kvWkoyM294U1R6MkY3bFlTY1k2Y3dh?=
 =?utf-8?B?YTUyTHVEaHRMbmZOdm83Z0ltd0lBSUd2b1pLWGlMNHBHMTRCQmdEQm5BODM2?=
 =?utf-8?B?ZjQ5ZlBZSTFKVGY5eUUvTjZVNHNsU1VXdGVFR0dVNjNTTHZmcWE2eFhsSEtW?=
 =?utf-8?B?VHV4U0dQV1FHbTNQMWpERTNqVHh6V3p4bXEyaUdSalZTMzl0MHZMa0FrcXQz?=
 =?utf-8?B?cGFhOXdrQS9TL2ZBS29mM0FUT0NRQXNENEVLZWNpSkVDb2JWeE51U3QrT2d1?=
 =?utf-8?Q?f16SDy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1hKQmpQTlAzNzRtS2x5NTNMeVhiajg4UFJRY0IzdGRaazNwSUhaQUh5SnM3?=
 =?utf-8?B?dUNXN0J2VExTanBhd3VYVk5hZzZBYXQxVzZDWHhIS3RBNzJNVGp0Mmp3ejNN?=
 =?utf-8?B?ZXhxZTB3MjV4alVZVnFSWVltYnpUY2ZuamUzYUQ3V1hFNkltRWNLWnI0Z2FC?=
 =?utf-8?B?amtzMklTV1hNZEVrMWRmN00zQTNkd0VITGoxeFRRbzZqekJqMzc4ek9hdXNu?=
 =?utf-8?B?b3craUVvSHF1N1Zwb2syMWRVNTZsQ0NUR0dhT3RtUFlsaGk4b0VWYmI5NmRR?=
 =?utf-8?B?bW9oOVNJRzNHcjB0ZzUvL3JxWnJHWkljbG5WbFZVdnFtWjlqY0hUbkM4c3Ni?=
 =?utf-8?B?eUV1TU1LKzZhUERXcHBKRXRNdGtyang1Ty9CUG91cTJUUkI0MG9wYktuaWg0?=
 =?utf-8?B?dmN3dEJtR01OeDhIYk5FRGRtdDQ0RWdaU0lYUkExRFRPTWdIMEFwM1FpUlF6?=
 =?utf-8?B?ZWpDVGFUTFd6RWpQdTNFd3FmUjNWK0lXeDNORmMxSGFQWVlLQWlSMmJZZkVR?=
 =?utf-8?B?Zk1jOVQ2ZzVudXp2TlFlTG9wTGJIdHFmM2ZWOUhoaWxjbFM5RWNucVZrTGlQ?=
 =?utf-8?B?Q0QyUGdPckhFdGd1SUswRXdaUjBoRlhNNU5vNXB3TDE3eXJvTkFES1NXejBI?=
 =?utf-8?B?Znk3T3BMdnpEUlFaQ295ZHB6WnpZZzMxVTZGU2hROHIyeDNjeTZuazBFODFM?=
 =?utf-8?B?UTVCSmdMRWlSalJBUlhLWUJNVW1oQkxoY2tBc0UxV25qNmh4MHJCVkpCUmNV?=
 =?utf-8?B?VDRaKy9rcDhHcStIdFZPdWJKODkrK3dhWG16dG9zOERjTWhoMHRmeG82UlUv?=
 =?utf-8?B?TDZDN2dJY1BOOFpUQmh3RGMxWDgzV082c3Rxd2pHWmMzQ3RSMjNCaVlVOTdy?=
 =?utf-8?B?ays2bUNlc1N2STJpcFQ0a0FUU0tIVm1TVW1icDNqMHFLTVVzQnUxVlViUndT?=
 =?utf-8?B?aHFHV291dHNiVzVkZlNVVGNRUHNabkVuT0NKeGJOVk9qK3VIdmFvT0lQM1Bi?=
 =?utf-8?B?anFMR0F1RnFSSFlXc0xWdU5LbHdjcWc2Q3ZiR0c0OUxRTHJhUVU3ZEFhOGh2?=
 =?utf-8?B?TExWRzV0NmZxNnlqNkZLUWV5djJaRWVlYnR3UWVJYnhCOUlYVkJVNE5mY1J1?=
 =?utf-8?B?dVJTWVdwbEY3b2dhalF6MWtGbXVYU0JXWkptVmtXVWZid3RpOC8weWw5RnRC?=
 =?utf-8?B?aWIzTzdSQ2t6TnV3VW4reEkyaXp4enJ2QTlBUTRsdi9OcXhmYjZ6dko0Unh1?=
 =?utf-8?B?UWZIeEdZbFNWUW9CMitDeU91TTBBTWM1c1JTSVkvMDBMME5zZVoyanIycjlC?=
 =?utf-8?B?YkNPZ2xwUlVoRGoySXFwS1Bwc05scVpYbmVVeUhRMkx1UVdESjlybUVpcC8y?=
 =?utf-8?B?UzU5YVdob2ZsdGx1MXAwWEk4dk00RXZ4bm9LRjVLODZqb3dJclFiaHB2QVhL?=
 =?utf-8?B?UldhV0xZZVhYMDVBT0ZLcElRYW1ORnk2eTJzRXkzM0YyQkNzYzllMHV3djlu?=
 =?utf-8?B?RE11b0NPbTNwWHVwWDl2YXA5d2U3S0pHM2Zwb0lLeHRHSm5ZcEtNenJERSt5?=
 =?utf-8?B?QVhKTXl1UUU0ZUU5TWZtVFdMYm1xSWo2RWR0VnlJbDdSMEx4VE1CV2w3U3FZ?=
 =?utf-8?B?SVloQWd2OVhwalA0bUx4SDlTZmVFSm1yV2Erb09kTEk3R0Fic1JPT2VRb1RP?=
 =?utf-8?B?aG1Gcm8xMERaZ1FVOU0xSG1XeENpMVlVYmRSaTZxUkJuWWJjczZEOTVZKzR6?=
 =?utf-8?B?cEFJSXBDeitWYTBlZ1BGNmR1WnhHV0ozOGc1TjVsczZCYS9mM2V2V3ZyT2VV?=
 =?utf-8?B?djJkNXpPZW0yZUUrSE1aUlhSNXlUU1NtTUlxcEtBcXlRbnBCaGhyTVc0M01C?=
 =?utf-8?B?OFBqS0x4dVhQQ1N1a1ZTSE9tMEZYQ0h2bktFQVk4TU8yMXRoNWduSzdvdnVJ?=
 =?utf-8?B?VTJFWVcrdU1RUTU1a01tQXRJb0JqUmVBc3lxcEdIQzhXbVgwLzFiTmxTVFZY?=
 =?utf-8?B?azR1L0Ntblg4NncwRkgrM0VTN0xhcGFKZk1hblM4ZCtBUkVMclNyZVBVZk5T?=
 =?utf-8?B?QUVDZEw1VUgxcUs5dkxkY25wM2g4c1dCS0lhbEY2NXFaTjJ1OVBaaEdkRVpB?=
 =?utf-8?Q?03yLxV5Hby2WIf9Qd2yExSKvd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd023fcf-d812-426c-3f4e-08de09f9050d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:07.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lasqwAyW+g8QSQZLU5OD0q8JyaHSMdDdedL+wfdCC91FaZEIF6IWL3Ld3h/jRif7212e6XuN3bn2eqPt/YBiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:13 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 00/11] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIE5YUCBp
Lk1YOE0gYW5kIGkuTVg5MwpwbGF0Zm9ybXMuIE1vc3Qgb2YgdGhlIGkuTVgtc3BlY2lmaWMgbG9n
aWMgaXMgcG9ydGVkIGZyb20gdGhlIExpbnV4IGtlcm5lbCB0bwplbnN1cmUgY29tcGF0aWJpbGl0
eSBhbmQgbWFpbnRhaW5hYmlsaXR5LgoKVGhlIGV4aXN0aW5nIGJvb3RhdXggY29tbWFuZCBpbiBV
LUJvb3Qgb25seSBzdXBwb3J0cyBsb2FkaW5nIHJhdyBiaW5hcnkgaW1hZ2VzLgpIb3dldmVyLCB0
aGlzIGFwcHJvYWNoIGZhaWxzIHdoZW4gdGhlIHJlbW90ZSBwcm9jZXNzb3IgZmlybXdhcmUgY29u
dGFpbnMKc2VjdGlvbnMgdGhhdCBtdXN0IGJlIGxvYWRlZCBpbnRvIGJvdGggVENNIGFuZCBERFIu
IFRvIGFkZHJlc3MgdGhpcyBsaW1pdGF0aW9uLApuZWVkIHRvIHVzZSByZW1vdGVwcm9jIGZyYW1l
d29yayBFTEYgbG9hZGVyLCBlbmFibGluZyBwcm9wZXIgbG9hZGluZyBvZgpzZWdtZW50ZWQgZmly
bXdhcmUgaW1hZ2VzLgoKUGF0Y2ggU3VtbWFyeToKClBhdGNoZXMgMeKAkzI6IEltcG9ydCBtZW1j
cHlfaW8gYW5kIG1lbXNldF9pbyBmcm9tIHRoZSBMaW51eCBrZXJuZWwgYW5kIGVuYWJsZQogICAg
ICAgICAgICAgdGhlbSBpbiB0aGUgcmVtb3RlcHJvYyBzdWJzeXN0ZW0uClBhdGNoZXMgM+KAkzEx
OiBBZGQgcGxhdGZvcm0tc3BlY2lmaWMgcmVtb3RlcHJvYyBzdXBwb3J0IGZvciBpLk1YOE0gYW5k
IGkuTVg5My4KUGF0Y2ggNjogVGVtcG9yYXJpbHkgYWRkcyBDb3J0ZXgtTSBub2RlcyB0byB4LXUt
Ym9vdC5kdHNpIHNpbmNlIHRoZXkgYXJlIG5vdAogICAgICAgICB5ZXQgYXZhaWxhYmxlIGluIHRo
ZSB1cHN0cmVhbSBMaW51eCBkZXZpY2UgdHJlZS4gVGhlc2Ugbm9kZXMgY2FuIGJlCgkgcmVtb3Zl
ZCBvbmNlIHRoZXkgYXJlIG1lcmdlZCB1cHN0cmVhbS4KCk5YUCBpbnRlcm5hbCBSLWIgdGFncyBh
cmUga2VwdCwgYmVjYXVzZSB0aGUgcGF0Y2hlcyBhcmUgZGlyZWN0bHkKY2hlcnJ5LXBpY2tlZCBm
cm9tIE5YUCBMVFMgdHJlZS4KClNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPgotLS0KUGVuZyBGYW4gKDExKToKICAgICAgbGliOiBJbXBvcnQgaW9tZW1fY29weSBmcm9t
IExpbnV4IEtlcm5lbAogICAgICByZW1vdGVwcm9jOiBFeHRlbmQgZGV2aWNlX3RvX3ZpcnQgd2l0
aCBhIGlzX2lvbWVtIHBhcmFtZXRlcgogICAgICByZW1vdGVwcm9jOiBBZGQgaW14X3Jwcm9jIGRy
aXZlciB0byBzdXBwb3J0IE5YUCBpLk1YOE1QL04KICAgICAgcmVtb3RlcHJvYzogaW14X3Jwcm9j
OiBTdXBwb3J0IGkuTVg4TVEvTQogICAgICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IEFkZCBzdXBw
b3J0IGZvciBpLk1YOTMgQ00zMwogICAgICBhcm06IGR0czogaW14OG06IEFkZCByZW1vdGVwcm9j
IG5vZGUKICAgICAgaW14OG1wOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNUCBFVksKICAg
ICAgaW14OG1tOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTSBFVksKICAgICAgaW14OG1u
OiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTiBFVksKICAgICAgaW14OG1xOiBFbmFibGUg
cmVtb3RlcHJvYyBmb3IgaS5NWDhNUSBFVksKICAgICAgaW14OTM6IEVuYWJsZSByZW1vdGVwcm9j
IGZvciBpLk1YOTMtRVZLL1FTQi9GUkRNCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9kdHMvaW14OG1tLXUtYm9vdC5kdHNpICAgICAgIHwg
ICA0ICsKIGFyY2gvYXJtL2R0cy9pbXg4bW4tdS1ib290LmR0c2kgICAgICAgfCAgIDQgKwogYXJj
aC9hcm0vZHRzL2lteDhtcC11LWJvb3QuZHRzaSAgICAgICB8ICAgNCArCiBhcmNoL2FybS9kdHMv
aW14OG1xLXUtYm9vdC5kdHNpICAgICAgIHwgICA0ICsKIGFyY2gvYXJtL21hY2gtaW14L2lteDht
L0tjb25maWcgICAgICAgfCAgMjAgKysKIGFyY2gvYXJtL21hY2gtaW14L2lteDkvS2NvbmZpZyAg
ICAgICAgfCAgMTIgKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9LY29uZmlnICAgICAgICAgICAgfCAg
IDcgKwogZHJpdmVycy9yZW1vdGVwcm9jL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArCiBkcml2
ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgICAgICAgIHwgMzcwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaCAgICAgICAg
fCAgNTYgKysrKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW5lc2FzX2FwbXUuYyAgICAgfCAgIDMg
Ky0KIGRyaXZlcnMvcmVtb3RlcHJvYy9ycHJvYy1lbGYtbG9hZGVyLmMgfCAgOTMgKysrKysrLS0t
CiBkcml2ZXJzL3JlbW90ZXByb2Mvc2FuZGJveF90ZXN0cHJvYy5jIHwgICAzICstCiBkcml2ZXJz
L3JlbW90ZXByb2Mvc3RtMzJfY29wcm8uYyAgICAgIHwgICAzICstCiBkcml2ZXJzL3JlbW90ZXBy
b2MvdGlfazNfZHNwX3Jwcm9jLmMgIHwgICAyICstCiBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNf
cjVmX3Jwcm9jLmMgIHwgICAyICstCiBpbmNsdWRlL2FzbS1nZW5lcmljL2lvLmggICAgICAgICAg
ICAgIHwgIDM3ICsrKysKIGluY2x1ZGUvcmVtb3RlcHJvYy5oICAgICAgICAgICAgICAgICAgfCAg
IDMgKy0KIGxpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogbGli
L2lvbWVtX2NvcHkuYyAgICAgICAgICAgICAgICAgICAgICB8IDEzNiArKysrKysrKysrKysrCiAy
MSBmaWxlcyBjaGFuZ2VkLCA3MzEgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCi0tLQpi
YXNlLWNvbW1pdDogNDhmMjFlNjZlMzYwNTUyYzc1ZDcwYTUwNDIxZDBlMGVkMWY1OWU5MApjaGFu
Z2UtaWQ6IDIwMjUxMDEyLWlteC1ycHJvYy0zODNkYjc1MmMzZjcKCkJlc3QgcmVnYXJkcywKLS0g
ClBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
