Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8ECAFE57
	for <lists+uboot-stm32@lfdr.de>; Tue, 09 Dec 2025 13:19:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C64E3C5F1FA;
	Tue,  9 Dec 2025 12:19:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D9B9C5F1D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Dec 2025 12:19:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9C6S9m038813; Tue, 9 Dec 2025 13:19:10 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013065.outbound.protection.outlook.com
 [40.107.162.65])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4axf4gsce8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 09 Dec 2025 13:19:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeXkNJjSIM7SYbtSbqAurwrYepPep1icpqOgqnJSD3/5EiVtqXQqc6ozQngQniQopXC8xXMBDXPfBFQCOdu5I4hzQ3biIod3XO/je/XAunD+V4UCOwNmm/z4GImM1vHLG1qNfmz4NpJEw8tgHp51QwUTK547hVioJrc8MQQr6v5KXAbDsAmOqQvilV1Q/QDoPSxoEkAhkXpOq+j5wVDGjzxcblXiv7FFRH3KIYMjOPqvAp1LcA3I3Mv2V7BcQGBW+Ct39auauq98rfImCTv/CPN98MSS4g5eiHaGURkE0lXzJ9lyWzKKMhBmdSYEQH1HEsMeWX9Mj2S50mgFL4dFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypt42U4kP9CkEkl/SMstBnU0fdWWmlOr5oC5wdCIvZw=;
 b=R8h4t5LqHwlPnLIZ80gQzg9kJp2KXc9TwLGOfEPvI0+jQTgz6n3oNbL86iBN89CnlCRvFlDVbB+vmMbMUUg3SwI0VohqZY0iWNgWnorPKDgNscKjFUgcPyTLDEq3ZHNX91TqBReLGPNAIdGhrju2hr4K+IMAYRuf+txUBd0uwn+idFa4dqt1O/PUhxHnHgS2ift/QW90BKpApkMMquNdF1U7VkMLcbwRT8gC6hobxCVia/KAPQEDStPxJCCcTdcYnGSUictSB063XjXTod2qb06lybVd9Toap68sEv4i3ATg6u6/N5UmiKsRI8HxR5xjqXneEh7PZaJB6aDU6wFNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypt42U4kP9CkEkl/SMstBnU0fdWWmlOr5oC5wdCIvZw=;
 b=frNyXuriZnllcLE4BxsSfyobhyffvEmskf5xod4LBNk2AFxaePebDC1uThHmuwSU7gimdR/k9QRJsJN2JZ5Zo1HiG4QyMg0j5s3Xqk+bb4e9mpWM7PMxYfBLDbgEKlj+sXxYpQv8o0uyK+hAwMnke/HFr9UR4/p3WIlFX3i8i9LltUlKXjjmKb9ihk/uyWiJGAH9aakMNEepDLy78MxPgP0whqeraS6C9dCV6cBLNNjDVtfi+djiGsDguh+z5XLLc1AeynXRXdApY53ZsPu0LIxkqagGD6s5N4lYMr06RU9dqtF22h0Kc1nqrRPHruNOw2CU79LIwORoMTOThx04qQ==
Received: from AM6P193CA0086.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::27)
 by DUZPR10MB8236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:19:06 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:209:88:cafe::ba) by AM6P193CA0086.outlook.office365.com
 (2603:10a6:209:88::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 12:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 12:19:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 13:19:48 +0100
Received: from localhost (10.130.74.180) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 13:19:05 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 9 Dec 2025 13:19:05 +0100
MIME-Version: 1.0
Message-ID: <20251209-ltdc-v1-1-9b8f14dfcb57@foss.st.com>
X-B4-Tracking: v=1; b=H4sIALgTOGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNL3ZySlGRdE4vEpBSDlFQzC1MjJaDSgqLUtMwKsDHRsbW1AIXf2xB
 WAAAA
X-Change-ID: 20251209-ltdc-48abd0de6852
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|DUZPR10MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 900c0c86-e0df-4603-aef8-08de371d25ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME11T0xLb2VyaW00Y3VKL3Jpc01wVzBvZXU0ZjloYW9WTHBHbTljZkxldVIv?=
 =?utf-8?B?RjRiQWNreXpoV3pONXFGOGtYZHhUcjhLcXF1RTBJc0FWWERWWnh2RGlyUTJL?=
 =?utf-8?B?MXo2QmY2Rzg1Q1dKaXAvQTBQaHVoRTdrZlNET1d2UHNKKys5L3h6N2IzSW9R?=
 =?utf-8?B?bUNJdXE3ZUVGNmN3ZjRyTERlOFB3aXQrQWRKRU1pV2R5K0V5TVg5S1h6OEpj?=
 =?utf-8?B?YVY5N1A2czdqMXhyWTlTVnlsMjhGZG1rdEJrRlJUajd4M0s5YlJyTEdPdVYx?=
 =?utf-8?B?ZEIvZDZxaFlXemIrTWV6T3RXM0hJTDhNcys4TVo0TnRyNmdsZE1qYUlOUFlN?=
 =?utf-8?B?bnlUZ1lZaGNDVXpIUG9HdWFwdjgzMFc5VnNtS2N2QXh2ZDQ0ampnSFhreDho?=
 =?utf-8?B?REpBRnUvaWV6S0w0M2VYZUVmaTRUNFVEOHJYY0ZHWklFR1NsTVI2cnE0elBE?=
 =?utf-8?B?WDAxNVpuWlNGSFVMWGt5UDAyR3phSEpjbktSVXpjd0dHYUhHT09YWnhENWFq?=
 =?utf-8?B?Y0VyZ2tWczNMb2tzbFczSXJHOWloQzVvZXEvcVBwSmxRc1RiV3hyY242L1hS?=
 =?utf-8?B?eDFDbHVWM0xRMnpKaHRldE9VZFFNZGdFbHhnQXdpem5yRGsyc0lYMXRLT2hi?=
 =?utf-8?B?M3NnUUpMSzZFcmszTUt1NTBsbXB4YmNNcjN3K3pTcEduOVE0ektyVitxSE93?=
 =?utf-8?B?YjVsMy9acmVZOFpES2VjMjVEVHhlR0JTK1VrQUErNis1QkZqVHFRdGZ4WHRa?=
 =?utf-8?B?NGwvNy9sUVVlemt6b1hnY244MHdlbU5OMlpHL2F1djJwR3lPcnV0UkVtVzBD?=
 =?utf-8?B?dzFFTUs0VnBCajNES0JRaDdaRndiUCtjcWl0M3BSakRqb0pkc0hGMEpaUkVS?=
 =?utf-8?B?RndXUS9SRnF1cS9rTnJ2WERFZUMveGxVdnpxSXQ2Wk5lUFc0Ny9HSHF6Z0dZ?=
 =?utf-8?B?RG5VSEV5bVltWGFVZDJzZzRzcXRhQXJSRXlFSFU4dTJ2ekx5MmtzZksreUcx?=
 =?utf-8?B?Ynhna1Z0ZU5qMG1yeDZ1cDNlSlBDSVljQWxHRGV5MDNXQWNwL0JZeXBFdnZm?=
 =?utf-8?B?R1p2WVZ4ZUZJd0FzeDkyQ21CNVpORHRlSTZ5UXNBU3Bjb3hjaVpyQy9ldmV3?=
 =?utf-8?B?S3IwNDc1YlJaK21keFMzb1UvcSsxZDhGRjBhUGx6S3JxSlREQks1aXA5eTEr?=
 =?utf-8?B?M3c2L1hhN3lQTjlXN3drVGgvZGtvQk9QZlpEUjV0cEFYczdOdk5WemdtdXFs?=
 =?utf-8?B?LzNUckhGMlpNZ2dBVW1oWEJ1TEt4dWZVckxOUlF6OWwzRjg5ZlZYenJGQlhT?=
 =?utf-8?B?N3pnWXM5emtQWE1KVnc4blBseEJKT2RDYm42UzhiMmh1aGp3bjE2aGRTVUMr?=
 =?utf-8?B?cWRrMEtPV0JEWEFMSDB4Y0hzRVp6ZnNhQ3ZMVVVNZmZ6S0lDd0xyd0N5Q0c4?=
 =?utf-8?B?cEppY1B0WEVSMmNXem9NS291dzFvYzEyZW5zbHBDU3hiR0cycWYxUEozVmFp?=
 =?utf-8?B?L2w5UWFZSGFSWWkxQU1SWFJFWURVU0pHbkdiMGtHRVBzaW1zaFZieVcweVVJ?=
 =?utf-8?B?dXVWejZsclhzYUJYK3hSbnpCWDB4bEpoRGwvdDhNZWxUc0RuYnI1dXhNc0Iy?=
 =?utf-8?B?bVlCbUN2elZuaUF1aG9aa1ZOamZ1OEJQMVMzUUdRLyttRTQ3Qm1sZFQySEFy?=
 =?utf-8?B?cUNQdmRlclhJeXpiUkRUMHNHZjRWT2U3OUJycjlGTzdCNEVmVGNCNUh4UVZH?=
 =?utf-8?B?em5qM2s3cWdYT2hoSHhQWjcxWlY5WFY1bVFIUTdzS0ZwZ0tRZWpXejZDdWd6?=
 =?utf-8?B?SEI2N3J4bUdtWU0yVGpJbTNBVytUcUNZQlR3OUtrL1RQYUZnZERITGFaRjJQ?=
 =?utf-8?B?V0w3QkRlTVcydWZwTjhSeVJoYnExOWRienk2WW5wKzdzQlZqTkRoeFlwRU1p?=
 =?utf-8?B?cUVrVjdJQmx6K1h5alc0VnpvV29DeVhHREJHM3ltOUhsNDV6VFdhdTk1UWc5?=
 =?utf-8?B?ZWM5TFQrekcraUxxRkVPSm5qbXBTN0FIYmNkVzZTb1EzTTBFWmJlK1kvQ1J3?=
 =?utf-8?B?a3VKSGRINXMreWNKemxNVEJLcU9mdzNMQlJCWXRTZzhuYktWK29KTlBRRzUw?=
 =?utf-8?Q?Y6+Y=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:19:06.0251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 900c0c86-e0df-4603-aef8-08de371d25ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8236
X-Proofpoint-GUID: y37j7axjkKt-3o0Y_H8sM3rf8y8FuuVN
X-Proofpoint-ORIG-GUID: y37j7axjkKt-3o0Y_H8sM3rf8y8FuuVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4OCBTYWx0ZWRfXwAnQY+UBvRaZ
 AdTxA48TvHbILWVPzHLgCpV9ZmRS60UeTAFNwnB83T59+vVxjHBksaal0M2xArJ0mh9wtr3vbd0
 8BSZZucVRWXECGUuAdWh/EjTD+mLtz+ABt/V7CSKra34zFSWZk0coHTMJ8JKOg11ToI43RpBX6l
 p7tMOV2qDjVF+JdmHa2rwTgBD5g9KxPV0QGf7aaDNC55N+Wt9+RyRh4Ot1EdFzTz+LoZ4rOdvrx
 UbKOxHGNaSmg1JgqkAaCZpyInsAS0EZ0AO7El/Ga5CcitV+nwZJ5yhCmqJzuqYPnCfYXOatarYE
 XZOyrNMwWzvZ8hOiMXQaMuXxOb5Mapqmc3DYV7d4kCu6mRov6TOL23KoaPZtyLbUULxbFPJqTCb
 7sUOedDjlloqcSXft2j2XLdc4izuQw==
X-Authority-Analysis: v=2.4 cv=fYigCkQF c=1 sm=1 tr=0 ts=693813be cx=c_pps
 a=k75yYl89YD9E2VdpC2Q0vg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=aCT4BCeVitVukfRiKSQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0
 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512090088
Cc: Tom Rini <trini@konsulko.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: [Uboot-stm32] [PATCH] video: stm32: ltdc: add .of_to_plat callback
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

Drivers should extract device-tree data before probing via the
.of_to_plat hook.

Implement it for stm32_ltdc driver.  No functional change.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
This patch has been tested on stm32mp135f-dk and stm32mp257f-ev1.
---
 drivers/video/stm32/stm32_ltdc.c | 218 +++++++++++++++++++++------------------
 1 file changed, 117 insertions(+), 101 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 834bfb625d2d34a44bd8edff1c92af6dec344c20..1c55fc94b3aa67dbcb822684c2c9a128b159e8a6 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -22,8 +22,17 @@
 #include <linux/bitops.h>
 #include <linux/printk.h>
 
-struct stm32_ltdc_priv {
+struct stm32_ltdc_plat {
 	void __iomem *regs;
+	struct udevice *bridge;
+	struct udevice *panel;
+	struct reset_ctl rst;
+	struct clk pclk;
+	struct clk bclk;
+};
+
+struct stm32_ltdc_priv {
+	struct display_timing timings;
 	enum video_log2_bpp l2bpp;
 	u32 bg_col_argb;
 	const u32 *layer_regs;
@@ -364,18 +373,20 @@ static bool has_alpha(u32 fmt)
 	}
 }
 
-static void stm32_ltdc_enable(struct stm32_ltdc_priv *priv)
+static void stm32_ltdc_enable(void __iomem *regs)
 {
 	/* Reload configuration immediately & enable LTDC */
-	setbits_le32(priv->regs + LTDC_SRCR, SRCR_IMR);
-	setbits_le32(priv->regs + LTDC_GCR, GCR_LTDCEN);
+	setbits_le32(regs + LTDC_SRCR, SRCR_IMR);
+	setbits_le32(regs + LTDC_GCR, GCR_LTDCEN);
 }
 
-static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
-				struct display_timing *timings)
+static void stm32_ltdc_set_mode(struct udevice *dev)
 {
-	void __iomem *regs = priv->regs;
+	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
+	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
+	struct display_timing *timings = &priv->timings;
 	u32 hsync, vsync, acc_hbp, acc_vbp, acc_act_w, acc_act_h;
+	void __iomem *regs = plat->regs;
 	u32 total_w, total_h;
 	u32 val;
 
@@ -422,12 +433,14 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
 			GCR_HSPOL | GCR_VSPOL | GCR_DEPOL | GCR_PCPOL, val);
 
 	/* Overall background color */
-	writel(priv->bg_col_argb, priv->regs + LTDC_BCCR);
+	writel(priv->bg_col_argb, regs + LTDC_BCCR);
 }
 
-static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
+static void stm32_ltdc_set_layer1(struct udevice *dev, ulong fb_addr)
 {
-	void __iomem *regs = priv->regs;
+	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
+	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
+	void __iomem *regs = plat->regs;
 	u32 x0, x1, y0, y1;
 	u32 pitch_in_bytes;
 	u32 line_length;
@@ -493,7 +506,7 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
 	writel(fb_addr, regs + LTDC_L1CFBAR);
 
 	/* Enable layer 1 */
-	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
+	setbits_le32(regs + LTDC_L1CR, LXCR_LEN);
 }
 
 static int stm32_ltdc_get_remote_device(struct udevice *dev, ofnode ep_node,
@@ -618,53 +631,99 @@ static inline int stm32_ltdc_alloc_fb(struct udevice *dev)
 }
 #endif
 
-static int stm32_ltdc_probe(struct udevice *dev)
+static int stm32_ltdc_of_to_plat(struct udevice *dev)
 {
-	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
-	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
 	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
-	struct udevice *bridge = NULL;
-	struct udevice *panel = NULL;
-	struct display_timing timings;
-	struct clk pclk, bclk;
-	struct reset_ctl rst;
 	ofnode node, port;
-	ulong rate;
 	int ret;
 
-	priv->regs = dev_read_addr_ptr(dev);
-	if (!priv->regs) {
+	plat->regs = dev_read_addr_ptr(dev);
+	if (!plat->regs) {
 		dev_err(dev, "ltdc dt register address error\n");
 		return -EINVAL;
 	}
 
-	ret = clk_get_by_name(dev, "bus", &bclk);
-	if (ret) {
-		if (ret != -ENODATA) {
-			dev_err(dev, "bus clock get error %d\n", ret);
-			return ret;
-		}
-	} else {
-		ret = clk_enable(&bclk);
-		if (ret) {
-			dev_err(dev, "bus clock enable error %d\n", ret);
-			return ret;
-		}
+	ret = clk_get_by_name(dev, "bus", &plat->bclk);
+	if (ret && ret != -ENODATA) {
+		dev_err(dev, "bus clock get error %d\n", ret);
+		return ret;
 	}
 
-	ret = clk_get_by_name(dev, "lcd", &pclk);
+	ret = clk_get_by_name(dev, "lcd", &plat->pclk);
 	if (ret) {
 		dev_err(dev, "peripheral clock get error %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_enable(&pclk);
+	/*
+	 * Try all the ports until one working.
+	 *
+	 * This is done in two times. First is checks for the
+	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
+	 * it scans for a UCLASS_PANEL.
+	 */
+	port = dev_read_subnode(dev, "port");
+	if (!ofnode_valid(port)) {
+		dev_err(dev, "%s(%s): 'port' subnode not found\n",
+			__func__, dev_read_name(dev));
+		return -EINVAL;
+	}
+
+	for (node = ofnode_first_subnode(port);
+	     ofnode_valid(node);
+	     node = dev_read_next_subnode(node)) {
+		ret = stm32_ltdc_display_init(dev, &node, &plat->panel, &plat->bridge);
+		if (ret)
+			dev_dbg(dev, "Device failed ret=%d\n", ret);
+		else
+			break;
+	}
+
+	/* Sanity check */
+	if (ret)
+		return ret;
+
+	ret = panel_get_display_timing(plat->panel, &priv->timings);
+	if (ret) {
+		ret = ofnode_decode_display_timing(dev_ofnode(plat->panel),
+						   0, &priv->timings);
+		if (ret) {
+			dev_err(dev, "decode display timing error %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = reset_get_by_index(dev, 0, &plat->rst);
+	if (ret)
+		dev_err(dev, "missing ltdc hardware reset\n");
+
+	return ret;
+}
+
+static int stm32_ltdc_probe(struct udevice *dev)
+{
+	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
+	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct stm32_ltdc_plat *plat = dev_get_plat(dev);
+	struct stm32_ltdc_priv *priv = dev_get_priv(dev);
+	struct display_timing *timings = &priv->timings;
+	ulong rate;
+	int ret;
+
+	ret = clk_enable(&plat->bclk);
+	if (ret) {
+		dev_err(dev, "bus clock enable error %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_enable(&plat->pclk);
 	if (ret) {
 		dev_err(dev, "peripheral clock enable error %d\n", ret);
 		return ret;
 	}
 
-	priv->hw_version = readl(priv->regs + LTDC_IDR);
+	priv->hw_version = readl(plat->regs + LTDC_IDR);
 	dev_dbg(dev, "%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
 
 	switch (priv->hw_version) {
@@ -686,67 +745,22 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		return -ENODEV;
 	}
 
-	/*
-	 * Try all the ports until one working.
-	 *
-	 * This is done in two times. First is checks for the
-	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
-	 * it scans for a UCLASS_PANEL.
-	 */
-
-	port = dev_read_subnode(dev, "port");
-	if (!ofnode_valid(port)) {
-		dev_err(dev, "%s(%s): 'port' subnode not found\n",
-			__func__, dev_read_name(dev));
-		return -EINVAL;
-	}
-
-	for (node = ofnode_first_subnode(port);
-	     ofnode_valid(node);
-	     node = dev_read_next_subnode(node)) {
-		ret = stm32_ltdc_display_init(dev, &node, &panel, &bridge);
-		if (ret)
-			dev_dbg(dev, "Device failed ret=%d\n", ret);
-		else
-			break;
-	}
-
-	/* Sanity check */
-	if (ret)
-		return ret;
-
-	ret = panel_get_display_timing(panel, &timings);
-	if (ret) {
-		ret = ofnode_decode_display_timing(dev_ofnode(panel),
-						   0, &timings);
-		if (ret) {
-			dev_err(dev, "decode display timing error %d\n", ret);
-			return ret;
-		}
-	}
-
-	rate = clk_set_rate(&pclk, timings.pixelclock.typ);
+	rate = clk_set_rate(&plat->pclk, timings->pixelclock.typ);
 	if (IS_ERR_VALUE(rate))
 		dev_warn(dev, "fail to set pixel clock %d hz, ret=%ld\n",
-			 timings.pixelclock.typ, rate);
+			 timings->pixelclock.typ, rate);
 
 	dev_dbg(dev, "Set pixel clock req %d hz get %ld hz\n",
-		timings.pixelclock.typ, rate);
-
-	ret = reset_get_by_index(dev, 0, &rst);
-	if (ret) {
-		dev_err(dev, "missing ltdc hardware reset\n");
-		return ret;
-	}
+		timings->pixelclock.typ, rate);
 
 	/* Reset */
-	reset_deassert(&rst);
+	reset_deassert(&plat->rst);
 
 	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
-		if (bridge) {
-			ret = video_bridge_attach(bridge);
+		if (plat->bridge) {
+			ret = video_bridge_attach(plat->bridge);
 			if (ret) {
-				dev_err(bridge, "fail to attach bridge\n");
+				dev_err(plat->bridge, "fail to attach bridge\n");
 				return ret;
 			}
 		}
@@ -757,8 +771,8 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	priv->bg_col_argb = 0xFFFFFFFF; /* white no transparency */
 	priv->crop_x = 0;
 	priv->crop_y = 0;
-	priv->crop_w = timings.hactive.typ;
-	priv->crop_h = timings.vactive.typ;
+	priv->crop_w = timings->hactive.typ;
+	priv->crop_h = timings->vactive.typ;
 	priv->alpha = 0xFF;
 
 	ret = stm32_ltdc_alloc_fb(dev);
@@ -766,30 +780,30 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		return ret;
 
 	dev_dbg(dev, "%dx%d %dbpp frame buffer at 0x%lx\n",
-		timings.hactive.typ, timings.vactive.typ,
+		timings->hactive.typ, timings->vactive.typ,
 		VNBITS(priv->l2bpp), uc_plat->base);
 	dev_dbg(dev, "crop %d,%d %dx%d bg 0x%08x alpha %d\n",
 		priv->crop_x, priv->crop_y, priv->crop_w, priv->crop_h,
 		priv->bg_col_argb, priv->alpha);
 
 	/* Configure & start LTDC */
-	stm32_ltdc_set_mode(priv, &timings);
-	stm32_ltdc_set_layer1(priv, uc_plat->base);
-	stm32_ltdc_enable(priv);
+	stm32_ltdc_set_mode(dev);
+	stm32_ltdc_set_layer1(dev, uc_plat->base);
+	stm32_ltdc_enable(plat->regs);
 
-	uc_priv->xsize = timings.hactive.typ;
-	uc_priv->ysize = timings.vactive.typ;
+	uc_priv->xsize = timings->hactive.typ;
+	uc_priv->ysize = timings->vactive.typ;
 	uc_priv->bpix = priv->l2bpp;
 
-	if (!bridge) {
-		ret = panel_enable_backlight(panel);
+	if (!plat->bridge) {
+		ret = panel_enable_backlight(plat->panel);
 		if (ret) {
 			dev_err(dev, "panel %s enable backlight error %d\n",
-				panel->name, ret);
+				plat->panel->name, ret);
 			return ret;
 		}
 	} else if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
-		ret = video_bridge_set_backlight(bridge, 80);
+		ret = video_bridge_set_backlight(plat->bridge, 80);
 		if (ret) {
 			dev_err(dev, "fail to set backlight\n");
 			return ret;
@@ -827,7 +841,9 @@ U_BOOT_DRIVER(stm32_ltdc) = {
 	.name			= "stm32_display",
 	.id			= UCLASS_VIDEO,
 	.of_match		= stm32_ltdc_ids,
+	.of_to_plat		= stm32_ltdc_of_to_plat,
 	.probe			= stm32_ltdc_probe,
 	.bind			= stm32_ltdc_bind,
+	.plat_auto	= sizeof(struct stm32_ltdc_plat),
 	.priv_auto	= sizeof(struct stm32_ltdc_priv),
 };

---
base-commit: c98b6a6dcd1fc7bcba081fc2353954e33de5053c
change-id: 20251209-ltdc-48abd0de6852

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
