Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A578DBD7E4C
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03CEEC29099;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4381C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3w5oT/LUZnynqaJRBpIxC/u+OBicHkr6ijJiAkX3+4JPeSNW0yvRq5cxIU4FYig4Bx8kXmJxn2BH069o6oQZtDo/E7H5wCu7T2Z+74473YqJGSm+THrok8/29e/opzKbAqnvnE7NgxL957stREsq5MsCRq4Q25EdBZzTgP2oA58gJRnF4v/cMAjf4Uj2xgsxXmvlAazhWCPkKDs3jtbesKHGpjQ/IZydNXaMnZOy6srCr+1cYTR9gqXUgE7o0teaRN86QPHqmsSo8hH/EwR9I695Mrjgv2oT7XX7hFTcx3H3B4S0BKLF+nMGyeClZAJKd+Rh4SFlPI0JwYvT0b2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkKDl0/9+BpgXOAlU3vrDU+wqswG28aHTNBtqlPEGtg=;
 b=H+AJ1HMC/3Wq1h04EbdhX6HWIZBkWLiGBOOkVEKyvZ1u9wRziWDMLDBTjAjBOxfWUdAs5Vmn4WlZA3koJs6sFomtT98O2YEI016pNSAwEoui0y6c8d5aUrPZRs15QAnanK55dVvpDIEeYr5ZVzfAloioqv8Yt5dBdzbC6pqA6iwcT70q9Lg0QUcyssgAURSyhOK9ilB5e9NyXmDZSGB4G3W8x3Z4EJeMzLa74jyCoKhZ4ySakgWv6aZU/R191TL66ih6P/sOT/Wf+/XaoJZdK2SDQzL84qjcvbf/zQqhBOsEHhQISUf81dlEOsRhJW9jDSisUfC/d+SWxgIi250Q0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkKDl0/9+BpgXOAlU3vrDU+wqswG28aHTNBtqlPEGtg=;
 b=tQ5zWWT++/yoS0mwIZMlNy85wavMPp5XGQnGg6YA8m5dZU73JTk+Am/lk8WwUS6VSNdAimCO75laZAn+Qfvqw9k8syP4HD1dbr635J1oTAal4UvVTkvI869NOCRxB2GxSXli3MWGqXMJR0cGY5+IcCe86+ijCsjBBed7y6aAIkVGX7QlLZ8UCXCTVD4UNKxCif20w969/M4AodbV5/fAK0Ogtx5G82IwN02i4YcuONgDiaYqOqXT+Tv3ws6gRjrcU3SqY3lCApECXEumsL2gdINVlXmhLcs5yX7gAZUfZBRy/oX9DbMDQtO/Jd+MEh4C05hoeeHXjS5qyOPjBNwC8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:21 +0800
Message-Id: <20251013-imx-rproc-v1-2-fb43a3fafcd0@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8a91914c-c82e-405d-1a02-08de09f90b97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ry9ZOXFUN1VJZVcrRG4ybHJJRSt1bVBJWm02RlpQZUk1SVN0UVZobGdLemFo?=
 =?utf-8?B?U3R5aTFZQVpXd2lrRzd5Y1UxbDJTWVErQXpjLzQrRU93eUVtTzdWOTZYRkVY?=
 =?utf-8?B?NHlIbzBnVXJzT3p1YkxqUG5ZNDlWZlBQNldLVWhkdXkzRDUrYXMvTFFGSFJw?=
 =?utf-8?B?Q0FlMVZBYVhTVWNqaGljYUUvcmNMdURGRWV5Nk5qRjB1MnVMMkMvNzZzcTZy?=
 =?utf-8?B?NG5xWnBMbFZ1Ti90YXZxcEw3U2xPelB5dHN2Y1hNSDRhK1RZMWpPNjJ3V012?=
 =?utf-8?B?UXROTURSaVdxeldtcXJDRWw5Qjh5MmJWVmszU1J5NGw4NnRnRGlNNTNuTmZH?=
 =?utf-8?B?Q2RCcmhicWNMVVFSTTZqTUVZUWpRWnFEN2ZUeTJWTVBEcWg5d21SNlZSckVD?=
 =?utf-8?B?aDMxdXVqVHhoWStYVGFqTnpBeTBDRVJjZTJTamt0NG5sdHBWbFBBbnFJS0hh?=
 =?utf-8?B?YnB2MUZCSTJqSFR6QUovRVl1YmR4V0ZFWVR5YUNIRC9vS0RNVStFYjRYeW0x?=
 =?utf-8?B?QmdXVHE0OEQvcnVFWGQ5TFdZdkFzMHEvUlFHa1ZUZnJUVHVjSWR1YkhyVkQ5?=
 =?utf-8?B?dXorNTJPQk5RNTRSUU9sbEhGS1gzVEtwMVBwM2x2WVU2VmVvWXV6dnZFdHlJ?=
 =?utf-8?B?S1EwaENleGYrRjNFWHpoNVpuTTY3UDdMZTNaelFBZytpRTNmbFhIT1NyYzcv?=
 =?utf-8?B?d29jZE9HTTBoeFZuNy9UNGdJbWVFbXJFWXI5RGFZTzZMRUVNT0pkVXV4UnBh?=
 =?utf-8?B?R2Z3Q3pjWGpBZFF0eWlTZDR6elgzczlqQ1pvejBTR1RGMFk2Smk3Y0loOWFF?=
 =?utf-8?B?bWlKTlBIVmdsTi95K2xGdmZSM0JwbmYyNVFCR2VLeXNPT2dmVWxCRDZqYUJD?=
 =?utf-8?B?eFBNV3I3UFo5aFN5UE91MXpzL3pWQjE4MTJ2UHFDL1JjR292akNXWDVpZm1N?=
 =?utf-8?B?RkpYanlrWDhFaDhrQVc0RnEweUZWUk9UQitVT1BKd3pRdnpTWVVCS1V3eGlE?=
 =?utf-8?B?Uzl0d293RHAvSzlNaWgwRitTNUZMaXhZWWx5QkdYckxwcEIwZkRjSXY4eUJy?=
 =?utf-8?B?VVFuZjE5cndKZkZDTjJKZVYzQThLOHlwWDlUeHZ4MzM4QVZWb0tEeDZVRldB?=
 =?utf-8?B?SnpoVDFjMXBETUF6SkJGbGRndFJpeTlyNlZvakR2R3VSQS9lR0loVm0rNDhX?=
 =?utf-8?B?TDNNODhtcFhNaE1QNkhFZ1ozU25FU09weDduTzMvcEh3WHFDM2hQaU15YjZ6?=
 =?utf-8?B?OFFVbkV2OEJiYnd5L3B4U2tkVnJYUkoxZ2s0ZUR1YWgvYkpNRkJMVXdFQk4y?=
 =?utf-8?B?USt1Um5TV0JLc003enVJRkZUUUNod0JlVHVJK0hJSXFmNDNlVnlVcFVTS2FN?=
 =?utf-8?B?VXJiem5FTHU1bWh2U21sc0wrRmFvUWoyRE42c3hjUEF4enBvYzRoWXlrQ3ZB?=
 =?utf-8?B?cGRCRzNlRHBzT2pXZW9Nem5QYWJSM25WSnRmMFJCeERVZ25UVkppSU12eW5Q?=
 =?utf-8?B?UWFCRXFkU2JzWldzUUU2VWFsSFN2VWNGVXQwQmpJQ1JEdkNSUGY2b0RnQ0Ja?=
 =?utf-8?B?ZWlWZnZtTVFSWXdheDRLU0JlVGw3b2hobWVmRjRKZWI2akt4Z21wdEZtTWNt?=
 =?utf-8?B?ZEdXZFlkYm9BNnc1Q01Qc2gxbTlBbi9tdysxOCtBSWk0eTNWQzVTajZ3UlJH?=
 =?utf-8?B?aXdJVkRicjhnWCsyYVVZTnZpeEkwTDFZbzZ4THdYUUc0bUlZTzFHd1AzZlJ3?=
 =?utf-8?B?bEdycjhoVUgvQ1VMMnMyN1I2RysxY0N5OW5YVXFSaHVzblJlNXd5WGRTWEx4?=
 =?utf-8?B?bC9BanozbXBuTEpONW9vRHh6REpCMGYzZkhTVytEbFRzQS94cG5Dc3B5NkVu?=
 =?utf-8?B?S1Jpc1NlYzE4Rkt1bDNPTmlDR2lrVlBMc0lvT2xORzBIVDhaZ0t2WEd0dkc2?=
 =?utf-8?B?UHE1MVlCNVp5ektsOVNVNnlBalI2dFRTWjJXbHhjVDJZMGhyU3ZCQzdZcHhw?=
 =?utf-8?B?MjZPa3NHRkRBVnVLQW1pcWRFQ1l4dnFXVDkyTXgrbVUwUWJ3RGdYeGgzTTR2?=
 =?utf-8?Q?HTMUTJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1RzMUtIU3BBZEV4UzQyT2dHa1IzOE12L21tQ05rU0poa1N2cG1TbEhEb3hx?=
 =?utf-8?B?MnFEL2M0YTh0QUdzZ0U0K1d5NlViWkJsd2FKbWFCdTdxYnhGZUZVUUpuQWl6?=
 =?utf-8?B?NnNRejBiSWpCSllGbUpIWW12NzZJMTVCcit0emQra3RHRVpWdGJHSDc1NXV0?=
 =?utf-8?B?eHdGanFSa3R1SDBJZGdDV2llbHRRMVZQQ1JWdGVicEczbTRvQ05vTzJOVnpz?=
 =?utf-8?B?dlFPeHNjengybHUyVGJlNVk2QlJ6OGFpUXpBMWhISGNzRnB3QmcvaWVCN0FY?=
 =?utf-8?B?SjhCMk9MZm1CR3J0K3Q4NmVaVFBrdW43SS83eUp5b3VJUGcrZ3pITDRMb29F?=
 =?utf-8?B?V2huTERtdms0VUdXSi9RYUpOOUc5dkpxMHZpeUNCSTFMRUUwVjU1aTVLMk5u?=
 =?utf-8?B?L0dWWVg4alR2dXBFNFI1c1h0dmNNWnl3TDliNVRaeTJDcjB3RmsvYjJIazFa?=
 =?utf-8?B?aDFTMDRLNE12Y0FaMWxJSjN4cUthcnZhVExMWEE3RktHV2xQaXZjbU51VUxI?=
 =?utf-8?B?NlpzNU9oQ3ZsVU1YeHlCQ0VtclRraFZaL3F2Z3hFaHVjUEVzNE5abk1ScmdR?=
 =?utf-8?B?WVFubWdGOEpJMkVaSTk3VklERnZJSEk4TzNZMmhJcUNnNzFSWVc4OUJkY2Fx?=
 =?utf-8?B?WHJRZHJEdmJiM1F2U0tNMHFVZ3kwcldhNGU5YkNnUk96Y0hFRS9rUDJtL3RT?=
 =?utf-8?B?ekZobC9JRW1QMVVGQzZBcEozUDFoMG16VVZ6Q0sxY1FVK0lqTC9hQ3RCcXA5?=
 =?utf-8?B?SHhZbVRMTmdkdWZDYzg2SXp0cnJ5SVVFbGZVeWx2QkpzdkRwS1FxSmJzU0NN?=
 =?utf-8?B?dUFXSTVzSmlNQjJpY2N1Qmlld1h6TXdOQkFpVXNhK1VPVUJzWVY2UFAvYURn?=
 =?utf-8?B?S2hZWkFqbEMxdUZpQnNHaGZqTDFVT2cwZVdmRXNmeGU5RXVIWHdaTEh1dGk5?=
 =?utf-8?B?Z0ovWFdmaWNrekxMN2tpMVdPaGY3L1dFSXlMRllaSDBlL3dLU2xOUFZYMHlp?=
 =?utf-8?B?NlZvQVJkSlRzQUkwclNIM3dkNnFnbmlKK1dHbTJ4eXN4UEhCOFNRbHFqcUNu?=
 =?utf-8?B?MFh3R2E4ZGNaN2FIRVZGVWZPTUIwMWtXMjNGcXNFMURZR2xLQUtQTDVGc1FT?=
 =?utf-8?B?YmpqTDZxK2J0R241NG4vM0xSOThoVmV1bnl2MjJhRnByRERkakw4Zm0xUUti?=
 =?utf-8?B?SlBCSlZRMS9MWE9xY0hydGs4cVByeUZockJQTitIUjFsVlF2VGFoOVgwdkFE?=
 =?utf-8?B?WHliODFNTXhrTmZvaVpqTk9GV1R3RktnM0xiZVFvWGhyTmlJUldxc2VtaEJE?=
 =?utf-8?B?WXJ4SktQL3djRlhRcitQLzJFNkUzMHcrUndiWmIweWFkSVRqaVVtb0tROXZE?=
 =?utf-8?B?Mm1LSmQ4TVI4Z1JEYlNBQlkwNFZOTE00UVk3YTQvdHZ2cElTQTJqcDNkUHk1?=
 =?utf-8?B?anovaHZPaHU4aFN2RlptdGpsb09FSWFkQmpqQ0t6eEhBRlpSeWl6eG1jK2pV?=
 =?utf-8?B?Z095MjIxdWFxNDBXb3JoM1VuNGUrWFBITnV2NjYzQjhvZEhSYjQwbXUwK3Nu?=
 =?utf-8?B?ZkRaUTd1T1dBWndsdTZyWmxreE9CQkE1NHkyTFZmWFFhalJ2emZJWXZ6RjBm?=
 =?utf-8?B?RnBqakx2VElzSUhuRGxIc3BkYS9vSG1wVkdtQjJLWGVKTHZSL1E2VWw5bm0r?=
 =?utf-8?B?NjR3UktvL2NKSStxeGtTaDdMaXQ2NnA2Vi9VRTJVUHdTcnFUekswV0cxdTlN?=
 =?utf-8?B?Ykw5MU9sMzhhWGNPUVVrb3JtZ3lWc3lOYjZ2RkkzVFBKVXpVMmU0ZDhtU1BS?=
 =?utf-8?B?c2JEeksraHY0aVIwbGVzK2FSNmZBV1NTRXd5UHlrN2xEWUhjczlOam13dCtX?=
 =?utf-8?B?WWhGdE5wd2hCL2pwOUFGeTNscENFUWVOUjlVblpWMWtLSGd1UjRGTFdZYms3?=
 =?utf-8?B?YThhcDlQeEp1cnhiOE9iV1lkTCt1eTRkNDlPUlIwV2R1aXBuN1pPU3E3SExZ?=
 =?utf-8?B?bE5tR3BBQnkwVnJGaE9KbzlUVDlzeUZLeDhNc1psOXpRM0YxM0dEU1BodFB6?=
 =?utf-8?B?azBHOXI1SFlBQkJpMXd3aGNjYjc0L2prelZUcEY2SEMxUSt0N0pBd1ZXUkxB?=
 =?utf-8?Q?Nk+b5NXeaskceD2Vvup1kdCaO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a91914c-c82e-405d-1a02-08de09f90b97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:18.1055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEVSMpo0hvpX4Z/HeoMPFV2BdxVrvs1Que2ovBmm0wuaIxmrZHzNcmj5AsEfr5ncYQ5bqWZ1rYyDfaxIqDROiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 02/11] remoteproc: Extend device_to_virt with
 a is_iomem parameter
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
