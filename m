Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DDC306B7
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:07:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63D9BC62ED6;
	Tue,  4 Nov 2025 10:07:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEDB3C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSc/d9qaTDmf6o21xMmH7RZITzHxGiB5vkK7UX7aa8OumGZHSJsvq0ZRxCMC9djEuN6B/jzXu0K8tV38hFrD5MSMiAH09Usund2s0uiQiMmWSYV733XwsiKfiYZG5D09bJM2gjNEYcnHhHCUJj8Wde2G+mBXg3NLLP+kFTgv4JMLHjvLsqWOzyd8Bi+fIXNucmtLZY1M5J7uxiGTnr6TlRb0pxuB/9z6oxWlN3ogZ7rjBTgXXfavBPgXQx7kPvAjqLWxnVywaqdAG521QOKI1KnJ19+faHgmsSTxmjySKeEdIw7sqazbHVWykLehrQLCGHs0rMiOy1iRhcjDTP7SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uPdOe50ITVAjg8Cwowb3m/TU0u1cxVNb8Pe4TNteVc=;
 b=T7CB910BfBbHGv8EbO+h9p5CRW/EZf0XEqFiQScXFMs3qf2oYrCHLD3xMS8gvVN36gbK0p7RGXo9DzQ6hQUEqPHV0r05IgQkh9s1RJcBauOC6yVcsvLTRvAZLNXeAMk9NvNRTKPRd5ZHkGfG/wpy57NMZdl3gGPQxr/oYEAtC7Z9rLdCQJpuMrQtNlUvpwAiTD/PEoaIs/p0jz1ByI91VfvZBCTACYd1NmJ7W+9TGqlmgTLEq+lqkQWQgV5p8PeGpkygPwEhepe+RdZaW5ysyvlcHMhC3qwVq15GSkE/OtZ6x2F91GOapPKZmF8rFn03rezoHYLsGHuQErGZXDKVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uPdOe50ITVAjg8Cwowb3m/TU0u1cxVNb8Pe4TNteVc=;
 b=N641noyphjYMgbsHSBsFDJ7vxSQv1Q5yj09/xJlT/CMBS7jrrvbi2nCkeZjrXtJ3HfLvvGUlDxOJPfJXO7xassRL+ogpB+Z8XM3pcaeaxw4TgpppSOOkS/DUc4bhJ61Fwg9hUN3/IUNhcdun5/wYhcCfB30SWcjJ8Ig1vuj30SLOUQjyvt1ErslivYlHtGvQqx7rMZdDYu4ZviOAmZIHO4fe5SbKoF9GiQ88+v4IWfZuwFj1cHZPayfrFl4StmSx0J6zE5CeB8Q6ATW25e9UFxKiOBsBMRKU27CRVJdURVQ469wXKnTWwiS7Cioe2NqiyNy8sWDEfZslGqohaGKn1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10955.eurprd04.prod.outlook.com (2603:10a6:800:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 10:06:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:58 +0800
Message-Id: <20251104-imx-rproc-v4-v4-9-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=762;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=u4mrKl8QAViYss0mU1iA60Nq9w38UecOIZ3xN5uEEKs=;
 b=YXwytc75gacKWt7bQpqKgACcqiSC7KYx/50LQmki0Td/jSRZrhnki5TvyOABfFF+4cYwYH944
 9HA15ufk9CHBLhpkTstzyaOheNiqpNzH8/kL+lKEhQjCdtxrU76j8ln
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: 141c8d92-a133-44fe-151f-08de1b89e469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDdrd2Vod01LSUlodnBvYy9kUzhKQ1NyblBzckJQSklaTkdpYkVHSVZZSUxH?=
 =?utf-8?B?VDludmsrQytKYkpaaDU3cXE4YkFMZjcrdU5LTTIzenRPOFZGRHJFcHpNOTZj?=
 =?utf-8?B?ZUdXQWk5bStZOVhkeUVSUmF5YnVkZU52Z3pPeDFJUDlYT1orcWJFWUhXdjNU?=
 =?utf-8?B?akI1d3VldVNyd0IzY0VwZnhvT25ic2dyYTJ2bE91cE5aRFlxZndGMnpIVzFB?=
 =?utf-8?B?ZUkveHFyNDBrNnp3MEQ3UWNlZ1BqRzloZzYzTGZGOVFWKzRkcjh3R0FDY2xH?=
 =?utf-8?B?enFuN1pWc3RvMTlENWh4Zmk4WmpFa1E4M00zNWJMRUxTZHJaWFBDTEVmdnJo?=
 =?utf-8?B?Mi9rSFo3ZEU3QVlrRy81Qzc2OGxJQXFTa2QwN3lpQnJkYkc3VkV0V3FJY2Yr?=
 =?utf-8?B?OW9ZK0lRVDJESVduVVdlRDJFYi9ERjhEQnVHdS8yOXFiczNyeWdQWk5MampV?=
 =?utf-8?B?RTJocTFhTHpMc3Uzc3c2NngveGFYOEpPM0FzaDV4V1VhdGpucElrVGRpU2s2?=
 =?utf-8?B?ZDNjd3RRaTh6U1JPclhCQy9MYUJvc3B0Vjg4Rmh0V1pEa3JIZjM5ZVR2UVYw?=
 =?utf-8?B?eTkvZ2l2TEF2MzBIaEJxa3dZZTVwSGxVQkRzNm5zNEdJdDZ6L3M0RWF6L3VK?=
 =?utf-8?B?VW1XZkdpeW8rZGJhZzFZNkVpVU9hMysrVWNRNXQ2c0dPVTNsQnFHVFJBR1RJ?=
 =?utf-8?B?cnV4Ti8xNzJKVU1DN1FRdjZJdlBiaHhOQmpJL2JCZjFOTEdESk5OQUZHcTBq?=
 =?utf-8?B?SVFzc1I0bnlYdlZWTk42cmovaVcrUDRlNGU2MnA3bGlXa2tpa2ptVWFkSTM2?=
 =?utf-8?B?RVpUeGhUeU1JZXRLNVZkb3RhSXd5UE5wM2pFOXVHcDlhbStXTDhjYXF1eDlH?=
 =?utf-8?B?V3diMzA5V2JiMjc1ZDMyWnJBaGJHKzdjRVdXYzZLcVZZekIyQUErVHZzbkJx?=
 =?utf-8?B?YVZ1cVBtSkNPc0U0WUI0WGRERlZuYVFkbFBFWVdVbFk5N1JsQzVEd20yYXBl?=
 =?utf-8?B?VkZsZmVRdld0RTJaS3oyTUhNaDQyRFRKanJpOUNhWDJpWlJqWTQzdUhHZXFh?=
 =?utf-8?B?QmxEK3VhLytsZmtBVlF6Y04xMXNWR0x1VERiQlh3K25sbFBoR0YvRTEwN1RJ?=
 =?utf-8?B?R0ZzUVU1SjY4UTc0QVVibjNpbmVmYkFkcWhERE5BRG9aK2FPNVVzb1RXTXl5?=
 =?utf-8?B?aEZESjU4VURlQ1prellkbVVZOE1DSkxacE9BeEFjcGRMZFlnT0hPcEJUQmlh?=
 =?utf-8?B?R24vNCtPQVBUc2p1d2dOUmk0Sm9DalpqelJOU0x0cUxnWVVFYjR2ZDhMZ1BH?=
 =?utf-8?B?bjVqOUdDRHBxZURaM1pSRmV3WEw1bjVaK2N0ZFR5NWpUZ3FQY01QRnQ2TEw1?=
 =?utf-8?B?Q2dnVXN1UlBSa2JZV2Nmai9nSDRMamVqVG5UOVltN0xmYUdhRWVUK1c1eWts?=
 =?utf-8?B?eWRHTDZKd0hOQTNaZ1h6OHd4Q2NLSGtMVFdBZjhpRXM3M0lKeGUrc0JHVkdM?=
 =?utf-8?B?U2IyU1lPUndTVkpFTVU2V0dRQmVDUjFYclJoTzVmeTd0WlBBL25hM3Q1empi?=
 =?utf-8?B?MzJmRWxMeU1CQUlCQ0dLWitwb1R2eUR2cTFmL2pmeXNpOUJST2tueUd4cFNH?=
 =?utf-8?B?ajR0b0c4TXI5a2gvOGVFZk5PZVlVd3hydUQ1ZnFuQkVJWmNsR0JSdDFTMmF5?=
 =?utf-8?B?T1E4Q3M2cjRUNXc2TWFVeTVUWHdENnpCZ0I3VkEwd0N5RHd3S3NncWt4Q2s5?=
 =?utf-8?B?Z1JtR3N3YTVOU2dtZG1NcjZKK3JFWmNXVG9Wb2RXdXJXZkFVQndpamhaQXNh?=
 =?utf-8?B?aS9LUUxKaDRpNjRwY2xad054bjlRWjQvZjdicXFjQlJKY2F0ZGo5MW10d0Jr?=
 =?utf-8?B?bW5xY0RGVGh2bWxPVHNhbjFDZ2h6bWRqVkMxSjNmUzVUd1hudWJFcnRLWlUv?=
 =?utf-8?B?bWVHazh3cnhHcXVaOC9QUWFpZTdDa1hNUy91bzRNeEs3ZERiYXFSNmF1WlBC?=
 =?utf-8?B?MHkvRmZIWFhGV1hBd2pOOTgrTnZDRXd5SVdwaHVGUERmMnd3S080V1ZUYXhp?=
 =?utf-8?Q?+N2lFA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmFLUC9lMWF3dGRKWG15QS8vVi83TkZJbXhtQzZTcHNPbml6SGhaTllwdmk5?=
 =?utf-8?B?dkZveS9BYXN2UDhOUTFqcGhiUEsya2JwY29ROEpJb0FBS2c0ZjNWdStQcGd5?=
 =?utf-8?B?MzBjeTVyc0VObFhOTDdpYTRyVWgvU3VVUFdTbFpab1k1SURnTWFVU2ZWc3ov?=
 =?utf-8?B?RFZtTzUzQ09PSjNNd0VQcnBJRlI3RmhaNzNiWUhHY0lXYUh0OGhmdjB6WGJw?=
 =?utf-8?B?MEFKSERwenRkTCtkdm9zVnp0dVVmYXg4cEdZTnpCQ29ib3hQTUd0TFk5bW5o?=
 =?utf-8?B?ODVITTRzdElDa0sxSEkwN0tPRndyWmYvTno2MWU3T1h1OVVOMFduVFhhUmty?=
 =?utf-8?B?NlZNVHJNUGo0b3J6bzJqUER6RXNOSGdLMGsvYnR4cGd3d0ZIc0xoTG5EUkI3?=
 =?utf-8?B?VDJERGlML0E2VU5qZmhScE9WMEY5RnFTczBUcERPUm4xNk1QN2xuUVVSQU45?=
 =?utf-8?B?VXNSVlBUSHg0SGh0NEc1UWF3TjNMVkhIVUNGWUpadERjenZjVTFjaTlydnpy?=
 =?utf-8?B?YUMxUW1ybWUxdnJJN2tNNEgvT2JYcUZ4alhNbjhEWnZtWklqRmJ1c0liSHRu?=
 =?utf-8?B?cFJXNi9NekRHcjNQdFd1RGlyeVVhK1RqUnQ2b3ZTZlMwa042eG9yenhkNCs1?=
 =?utf-8?B?aU1xUEJNbjRTeTU1SzZZTWgwWTJveTJrVU90c3pNR0U1OUtmbDN3Q3c3aDlw?=
 =?utf-8?B?RzZOaUhodGhsbGlPZ1BUZ2F1SFV2VVRzYnpLL1ZyNENoQURyTHV2OGx0VWZ5?=
 =?utf-8?B?Q2czd2lJcmhrNXZtVEIvSDZtUWUzNlZDR2doRDFTVTZZeXNWZ2ErWVpXMWQ5?=
 =?utf-8?B?VzNFMUNZTzVrZ2d5R2hSR3pRaTlmdXRrL3BVYXNuUEc0ZC93Vmp5K3crOUpt?=
 =?utf-8?B?TTFnV3M5NHExTjJ6NFp2M1BLU0dUNTZtaHRoL2xpb3hzSUQvZ0w5SWRveGgw?=
 =?utf-8?B?by84cElMV2VETHgvMmRnN1hXblF2QzNQRjJ3UFdRQUpKa0duQkVhRHQ3MHFM?=
 =?utf-8?B?b1FxTVNvc2tSVVV1eWNOdWNud2xGdFFqbHEzUDhUZ255YlNGWXhSU0pTRFBR?=
 =?utf-8?B?QXNhb2UvVm1kS2tZbzE0N282R241WXhac3lxUkROVW54citFRFVlZXB1ZUtt?=
 =?utf-8?B?SGhoT1JtRG5VZHNJQ0ppV3BsZVJPdXlUQmZjT3h6YThBN2hUMEF4UEEwVHVB?=
 =?utf-8?B?ZWNBdHNxQmd4NDdaQXRNd1V2OHlnS2h2VXpHZVFtcjhDKzkvZHppNzVXRmtj?=
 =?utf-8?B?SzVReHBGYjBtcGVBbDNVMXYwY1BQRUJjd3d4YXk0Y0M3M1ZrVjR1NUhKUHQx?=
 =?utf-8?B?SzVPZFI5QStFcXB5Z1F6c0JIKzNaRi9LUE5PbjFnNXM3WDZ4QUQzT1JRR2lW?=
 =?utf-8?B?V1RDR3ltMWxYMm1PbVBnekRXRjZaK2ZxbHpCU3FtVThtSmNUaVR0SGh3MTZw?=
 =?utf-8?B?K0V0TkdpM3pUR1N0akFESzBSRzNqVk1RQ3M3ZFpOMDZOaUJtNFZGWEVMREda?=
 =?utf-8?B?Ny8vbzRIbk40WXZwZFhzZFRiSnAwUWpqTHluNjU4eC9aZE91bE0zUnBSUkcr?=
 =?utf-8?B?Zy9qcWFVODdLbmxjWVl6VUJTeXlxZ25jMitGSnZrQkFkTTAxQmZFRS8rRU1w?=
 =?utf-8?B?VjIrSmRTbk9IcTltWDFndHhOWURYc1lTTXYxZ1k2bktDbTU5RGxLTEh2NUdp?=
 =?utf-8?B?VVROZG9ZZFAvc09RZk5vd3dnakNuczM5bGkxU0xQU0N3Tk1aYnd4WDJHbXFk?=
 =?utf-8?B?OG1ncXdUc0ExT0JGYUJlajd3eGMrQ0lwZ3hxbitUYlcyVFRoMGVsY3YxZExu?=
 =?utf-8?B?azNUVzZNcnd5cllQWlVHMEhSeGFsL3pnMTR3Q2prekpRYzZqWXc5Yktjajl6?=
 =?utf-8?B?NkxKaEZVTVhqVVJ5ZnZsTS9jSGdpdkl2NDlhU0dRbGVLR0lmelA2Sk1EenRX?=
 =?utf-8?B?V3B4WjRXekpsTW9yVTlsejA0RDVlUjV1ZGFrM2FROVluSkVVZ1cyL2tJRDZ6?=
 =?utf-8?B?L0N0cTdEa0VicXBmanlwR2MzRnI4ekxoNTNxcU8zK1N6ZXZaelNYTmR6cjRi?=
 =?utf-8?B?YUdQamtaNDg2K3dMOElOUFBzOER0TkJQMHY5U2wrbTluV3E4ZzVlNjhGa3pS?=
 =?utf-8?Q?eM+p0PXF2x+kYGme4bndQhLLY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141c8d92-a133-44fe-151f-08de1b89e469
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:59.1566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CihR4CKX6ZPj7JoIQb5QMFK2HVX/2Hup2EEJIGSYhAmqA3VRLE5WrZ+x3RsQptQHM4If9KS8dNB6vDSsvcnuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10955
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 09/12] imx8mq: Enable remoteproc for
	i.MX8MQ EVK
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

Select configs to enable remoteproc for i.MX8MQ EVK

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 0584dcb580fd4b25582b26b899c70f3cb78a3858..030ed2f0633212499bf74f232e9bcd19d9bcd86f 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -67,6 +67,10 @@ config TARGET_IMX8MQ_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
