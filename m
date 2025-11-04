Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF1C306B4
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54BBAC62ED6;
	Tue,  4 Nov 2025 10:06:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC788C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtplfmlhX0DTpj4cZFuE+udxD6aQPZCWXTT5Ch0gb+p57R8CgnbQDd+oqM56kOcmg24FyoIkRulFLy9tB47mntM8V+XXCQ1A0AhHGHGzKaF+WSWBEWXnMlFrpEFLlO8IXKztQbXHD6faSaizsfrbcITFlg1Z9EfpKnq/AfFXxQzd+r5Fj32cU8xbjkPOj+NcnhOzszGnHy8pNGMWzVi6uKeh8qckrky0zDeoni/BZps4Xnmjv+NPyKzbzYwtvZC0v5lpi5d9ye8yMojHa+72ysXt3qZSnNAAeyLvHUgg3wLAizHsC6zINpnQgjpOXZR9wYeVlj0n16ZbumbQUXsEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2MfTdr0sGgtArBvrrsOqZ3uGgyi2tZ0043yKJtGlVc=;
 b=eUEr6Wm1TMP3XTeJWkGP4Nkf2z+SG546ak5/LWeayrZp1kXEca6tmidKT8IdMvhYutpGL51Mszzuedn0donwFdV0VDO+dBf+Fn8mlrkiNPT6vaoTthWLuCpUvLvBTfzZOW1vSUg4YPFyRlzC/5Y8++86cN1TyYxO5JMvUWTH6W5ouvmjqD85asBJWUc5EG0YLMYXPh3/S8x/iw6SCXg7+yBxSH1INRc/V5YE7QdnBVnaX+J1jh4xYP1fniFNo5wN+3cyOnqeQHqMtB7M845OkoMv6rHLRUOUtOuT+k5uVzvxFzNF6IE2yfawMyg+Kj+TAOGum2d/ENCvZpZc4ZUitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2MfTdr0sGgtArBvrrsOqZ3uGgyi2tZ0043yKJtGlVc=;
 b=Q+/JT6H/gsfuQXq7WjeIO58VSAejdpVVW9Dz5uEfqIoDfK9Jov0mhnQFw54pMXKcTvPo1zZtBRR51RmT2r2ichUEWeXt4kkCkZNSHgRmejiTQqMi63bI6sKhHxAwFvv9GFpWsPpd4MPMaNw2v4scvMfyDLM+fAKhv7xsdF+lMUOUDc2fvt1G9RgC8/ATZlkXxb+/hIvhxSAokCqjrzKDFOIYgQGBY8DDwZzxH/5nXGcm/7fEo5haIx5Jwt7DCwNloiNuGOqc04bm9YQ/qokZJIDtzHBC/FeASyVzl7MmkzGz3sDAonAuwfWoNSspgcoRUIdz+z8j1yLYmhZLnimHZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:54 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:57 +0800
Message-Id: <20251104-imx-rproc-v4-v4-8-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=1053;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ng+m0tT1Cpko2PTCFlrPuzv6RY6JW3cnRutVpkJhT/8=;
 b=VBf0JhQOEQGO5CYP8QZnJGJIUv5kdgTGboxG+6fG3WFFijgQYTb4PKr/N+cu7v5jhi/bqo19D
 EJ5dlhL3uOTDybr96hHgpPI1ifTb0jmSaBSmlJuyH/drfTjtMcGV+rr
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6625b2aa-7725-4523-0537-08de1b89e188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3VHYmlsQjRvSG54SWVLNDg4SEJSWjRQWjl4WWVZVS9UUTN4NDhUM04ydkg4?=
 =?utf-8?B?VzU3RVFwR1VVVVlsSy9hdHVONFQxUWM2TU5lVDF5ejJ3WDQ0NXZtajk1Qy91?=
 =?utf-8?B?djZxQWdlcHd4TlZaSklrNFJGYkJVUGpHQ1E1c0xnYktwc2hsbWxrdlFoMXNH?=
 =?utf-8?B?Mjh2VXRsY0xSeWFsbzRlZUc1K2lQZ2hIb1ZXNzFjc3RVYnZ5NXNoa2F3QUdO?=
 =?utf-8?B?azlCbXdVYko0MHBOWCswVmcwWkhBOFN4RlZvMysxQ0J6c1JkcW5JYWpjdzRU?=
 =?utf-8?B?azRXT0NKOWVwUTJSSU1RbWJIU0hlb0N4d0FURHlYUldpTjg2M3M4VFRuTzU2?=
 =?utf-8?B?MnVRYzJLZDlKaXltVng4eUJMWURlWGxZamlUZ1VTeFJ5SXhCVVZaZkNEd2F3?=
 =?utf-8?B?T0Rxa3RXTERSYUZBZ3ZUWjg0Z2lTKzFVZkZFeldJZDhtbitpQnI3d0N5THRE?=
 =?utf-8?B?ekdZUVVjNFdXN2VxVkNBZlYrTXdsWGQxNDNrSTZUcTVZbUkvV1IrSkZScWV4?=
 =?utf-8?B?TjVFeFFQbTk3N2llcm5aeDh6elpYOGdXTjk1Q0hENmtKRGZoVTdNL21yQjBp?=
 =?utf-8?B?R0R2alROckZ0L0szazVyaEliZEZ3bmxVbGRHRzdaM0lZQkYxYjBvcm43R25E?=
 =?utf-8?B?bmtLUjVFVEtBWEFLRHpBOVk5dzVrbmRkZWpjclRxOCtzMFBiUWRWTHJ0UGtn?=
 =?utf-8?B?bGdBZFY3MHBINys3YWk1eHI4dXgwRk8zVE9yMjlwY2tkWTdrMUErTW1NbzRH?=
 =?utf-8?B?N1RYSmpqR0xvaXF2TkZpS3EwN3N0bXY2QjhqRjRkTGNTL3YvUEVRUmE1U1Zs?=
 =?utf-8?B?YmNoWW5ycy9sYU5xNklkRlJmK2dmK0pMS0EySHkzS2VyNk5Td1owNXM4S0ZG?=
 =?utf-8?B?Y1g2aElTVG90NXNCZFhQTDBYUUtLaXJXUXFKVFZJN0FIS1JlemlWbWdCMEZU?=
 =?utf-8?B?Rk1ZUVZxR0pmRlJGYzNaUi81OXQ1MXE1Nk1vdGdDSnQrVXdVZnVwS0tOKzBm?=
 =?utf-8?B?UXZRYjlQRzNOcFF2T0dRS056VjMvUTMzc1huKy9ZcktaYXZRYlJRL2ZTVWtU?=
 =?utf-8?B?ajVCRHJkTk1sZmRDVms0M0pJSEFVQkJMMHB2aHNEcWdvZzNNZE11cnJUbTZx?=
 =?utf-8?B?YktJVFBtMytpMGQ5OGVZam8wWkZwam9panlyRVFWN0lGZFAwRXlXbmpwQjls?=
 =?utf-8?B?aFV5TXROdjQ0bmRrRjIrNnJkcE5FWGVicTVJeUhVanA2WmNGRURoaGNaREhQ?=
 =?utf-8?B?alFVdUR1Vk05YUdTbUNKaUdrTHZLTXJQK0doM2hDMFRWbXFhNEF6WjRXK0VD?=
 =?utf-8?B?Wjkyd2NTR1VhdDV2U3NzcVJyQk9leHNPSFg3dlU3b0JpR1RYdlpkcGpHdnBP?=
 =?utf-8?B?S1IzZnc4THRoTmZFS2FnRGRvWE9kQU9jTjhhTXNqd01HcnVldUkwZWVSMnFj?=
 =?utf-8?B?VisrQzF4V1o1NVpZVG4rZmNNaEJCRkRhbjdVTnJMdkpaZkJEUVRiL2Y1VFFr?=
 =?utf-8?B?Y3RYYnpoVnd1cXRDMndreHJ0Lzl0T0JsYUdhSHh0NTMyTUsydGpRbU5MaktV?=
 =?utf-8?B?SDROWjBsc1JseGdXZzhqNXU0NVc4N3hPN1RBallvSFhCZnJldmJYKzNSbU1t?=
 =?utf-8?B?VVhOT3JqQVZnVFNaRnNOYmRxTXBZMFhpbXlGZjN2eElPak13ZHI2K1B1M1JT?=
 =?utf-8?B?YWxuT1Z0VjVJUTE0UUgxUHlaUUtUdzNwTUFUTyt6czVTSjBzN2djQTRQVTRV?=
 =?utf-8?B?SkRTMWZQYmsyYThzRkI3dDY1V3o4aU5oT3Z3c2NHUEQ2WVhiVC90Ums4SEM4?=
 =?utf-8?B?azgzN0JFZE0ybHBuQlEvYWs4MW5wWkZPdDdiSDVmcTlLb3JJaE13T2l2Smhz?=
 =?utf-8?B?Vk9xUUQ5SnJiM0VnaVR3N1ZsUjloSXBSdExDVXhXWmxncjgwSzdMN1p5eVMv?=
 =?utf-8?B?VzBzQjcwcGltdGNtSlpYMUthQU1BWTRPQWsvTmlzUU1mM3lLakVqNlNrcG9i?=
 =?utf-8?B?ZUtYQmRLc1RRZXZwRDd0U3E0bFlOMVY4Ykl4VHM0eXc5cXh6Z0JCTFhNSnM4?=
 =?utf-8?Q?pV6kWG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk5JeVdrc3phTXYvQWF6Rzk1UC9nN05oeVFVUEQ1dVhUNGFTRW1hUHhSWWdZ?=
 =?utf-8?B?eEE4M3FrU0JMZ0pvT3VXWjdvYTVKenFiVTRYZXRHZ0xVZFlhMmxVMDJkdDlE?=
 =?utf-8?B?bkFsemJGZXpzSlBVZ2hjekRZV3JyVWF3Vmhma2NNS0pBeDBCR2xrTy9WNCt5?=
 =?utf-8?B?R1hVcEtLZ3pCK2syTnVXV21CMjhRZ1BiWGR1WjZKcnZJclNxaDBiZklXWFRi?=
 =?utf-8?B?OXI1Ny80amxuVXRDRFQrZkxrQkUrVklqOGQ5SnFoUmE1dlp2c1orUUkwdnZT?=
 =?utf-8?B?eklSNzhzVXJZY3lNSVduRVhDclp4WWFwMElEdnVJQWlzSEo4a2kvN3k2YjR4?=
 =?utf-8?B?SmU0eXRwU2VmSjlJU0lhUXNhMjVYaXFvbG0rSFhwWGFYMzdyZ0txamw1UkJZ?=
 =?utf-8?B?YUR2enhGTjJuN3pwcHZyeEhCUm1SYi9xRUc1K0NOSTZjUUFwZTlpYjhDL3oz?=
 =?utf-8?B?elQ5elphVDdXU3ZlT1VucW10MzY0OThiL0tLeXgyeEZGZnhMSGJYVzhwd05B?=
 =?utf-8?B?TG9Gbkd0bFpRdTVrdUZPMGRwbXhUd1RoVGRlTVhHUjdKZHZsaVd4OXErVDl2?=
 =?utf-8?B?YTVZTDhSRlpVaXQ1YUp5MU5QaXN3VFk4Y1FCODJVMklvVnVZdTBJVjUvNkFj?=
 =?utf-8?B?b1BsME9kcUVjb1g1cHN2SXVlVmRZc1EyWDVNOFZFYkVhVlRsQ1lvUDBPWHV4?=
 =?utf-8?B?ZnpyZkVSQncyWmw3Uzd6dXlTRmpuaElDL3JGYmh0dUk2ekJTT0c1YkY4c1JE?=
 =?utf-8?B?Vjc3TFZtbW5VekVvNGJoenhVSEtrSkpwSHJTNWRVSGJCdzNwU2xCcDhMd2V6?=
 =?utf-8?B?VWtCeGJRSTZIQ1NucFJaMkdQWHVHcGY4T3oyQU1iWGpTcnNTQ05sS1YreTFi?=
 =?utf-8?B?eGVJS0ZoUWpjeWZoUldqcVJ6b2dBY1p1a2VGTWwrTHJpS2UvQlN5Y0JUaC9y?=
 =?utf-8?B?cVpyUVB1RFdCYnRNRjUwSlVrYk5SV21JNFdCa21JYVY2MjYwc204TE03MzZu?=
 =?utf-8?B?eENCbUlXN284eXdHV1RuS3JJYkFtM3hWOXdjTldwVUk3TTYvdVlSR1htc0Rs?=
 =?utf-8?B?Q1V4cUxBQm5COFhxcWorTEpGQ2ExV04rQ29tNDJWbU9nQmpVL3JtZlUrbFZk?=
 =?utf-8?B?Y0ZpMDZ4dHhyUUVDUFF3VnZudGhyTlgzQm05bkoyZURueGhmSWpUSHl1WkVG?=
 =?utf-8?B?cUxGQk4wZHlvSThETmwxMGZwa3dOQjZ6U2M4bUNvd0wwMTZEN2czdEtRQTEz?=
 =?utf-8?B?RHUwWmZBWDVGZHVLaGZjWTNsRnRaK1Vtb0k4WjlYMXlOTXZyVEpxaFd4ZEtk?=
 =?utf-8?B?TmpSb3pFS3hmNTNSR05CQmZuL0VFdHg1OUFyakJVOHhIK1hjTVNuMHNCR3N5?=
 =?utf-8?B?d0VTRFZBSXlVTlRJSHpBT0hpNktwdmpTK1o5Q0tYellSMDhaeUM3R0RNczRj?=
 =?utf-8?B?ZXByM2VrZ0RrTjBhamVnN3BEMk5Ldk9rbFZuSUoxNGVTMDRvQXlsVDVTUHI1?=
 =?utf-8?B?ODloLzV4dSt3UFBXaWhXbDVCY0NpSFhZVW9lWVRFeVlwbys0SGtITm5EblJX?=
 =?utf-8?B?SERsSUp4TTcxbk14Qzc1OE1TVFNlOEQzbUZjNFpBeTRGYTJ1cG42bXNFYXNN?=
 =?utf-8?B?emhrYTFFN1RJYkxBSXAxWEQ1TzM4OUZFWkdjT2ppYXdTanlOeit0Q0tGTWNk?=
 =?utf-8?B?U3hKb1R0SVhNRkRXdnExdnNjbFNHM2RqNWRmK0xHRFA5V253Uit5bzdNMUVZ?=
 =?utf-8?B?SkNvUVp3SittMUUvNGliemRrZmxUb2RtUXBJUTl3QVVvdmQzdGRDYTY5QUNu?=
 =?utf-8?B?bndLNEpnY2tiN1owOElySTVpNzlXMzZzYkZ3RWJSaDVTUldQNktzTVc1dlk5?=
 =?utf-8?B?bytQNFNDOGdmR0gvY3ovc3A3TWw1cU93STg2VUJPYXJsYzgvcUVRMmxMM3Zj?=
 =?utf-8?B?YmNXejFmdS9Ud2dzNmlJR3BoMGhFUHZkL3hxNVhJTzVmcFFqSkhxdjNmU3lv?=
 =?utf-8?B?RDlZSmxvSEZHV1Q0U0pZV0VQWVIyTWcyTjVRRThGVHl0bzZScUQrTTdqaVNI?=
 =?utf-8?B?NDNxUnA2eXYxYWllTEg0K0hBQUNUeE9Tc0k3UVpaMm1qNHpObGorRnNvajA1?=
 =?utf-8?Q?fpwEplOgRhRPdbUhbm5i5RZgb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6625b2aa-7725-4523-0537-08de1b89e188
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:54.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT3e7qGdhtbIxCAIKpDC4cBxCCTtw0wMluLqkFJJznO2489VVVG7sH2X8QvmKlqZkTuqa3tXm7Invs0LowmSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 08/12] imx8mn: Enable remoteproc for
	i.MX8MN EVK
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

Select configs to enable remoteproc for NXP i.MX8MN EVK boards

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 35da05e93f5300ccbc77eeb3ad07050768900b94..0584dcb580fd4b25582b26b899c70f3cb78a3858 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -175,6 +175,10 @@ config TARGET_IMX8MN_EVK
 	select IMX8M_LPDDR4
 	select FSL_CAAM
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
@@ -186,6 +190,10 @@ config TARGET_IMX8MN_DDR4_EVK
 	select IMX8M_DDR4
 	select FSL_CAAM
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
