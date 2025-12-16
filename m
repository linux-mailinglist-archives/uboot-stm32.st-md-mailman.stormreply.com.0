Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DECC3F3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Dec 2025 16:32:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B0F1C7A834;
	Tue, 16 Dec 2025 15:32:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B52BC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:32:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGFTUWN1173909; Tue, 16 Dec 2025 16:32:03 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11gajxqc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Dec 2025 16:32:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S15ZYanXlV3emg5zUUAFo7cYqNnmIxWUFxQOXpx+9+MUc1tZ3sysYWEdrESskMmNXUxufHpZqydBasOYBhA+eiPRFAkPIJC4Sj6jAm9v3XftUH8AeK1EUONVbgqN/C3ajG6WaAu5Y3NrQB18Nnqzlwa7i/6H0uOQ/bv2HIFgH/N9h224QkH9xrVGmY9B51NROjaR0RHqF1R3JZTKHAV9V3VVWZq3RD5GMPb+jYW62FKMGEtPqWCUrOHr+EdAjecDWGIMjnWrhJV74vE5+kpxyVI2qStKMkk0C19S82qYPErT2gAorWzbaLW1oghUq6TkYAqYt5ZIh+6NhY5kLNLzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIDtTLe3cZ1qmIJ2But1gwk1Hxqa4cXellaBeEcCQy4=;
 b=zDMXt7+KI49K2ThTzEBnUb3cy9+MElf5WiawyhgrZJblVIhxJ+sYD9Nnsp+db23jyM72AD+rjztUlT3D8jnhNvg/N2/2OpMI2CHx3k/UCaaAA/gCGWk5y0lK47WNWvZRBEUzW+vTMmTP4oPCSh1R83F978zqC5DIK7l6uvWVPT++xXBM4+OqabTRO/x/v7uBBcsjXAkOprAKwFOqF6fnFcEDyD+tcxvbSeypEhTVV+NoyyBksaetmJokxHYl5A0yJ24ba3F77ddqWOMdJ/AcW2xf+jKY6YRR2ifbu8id9SbaMkvViU1t/bG7Kith76KIg2yI2u9CNN+R0ZdYnrAT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIDtTLe3cZ1qmIJ2But1gwk1Hxqa4cXellaBeEcCQy4=;
 b=cglHAGeKUrLtVTHlwMirU1063i0babpZdiOxhEZXSBKy474LuNaBIJ+eCaQ6enbLDqd1KfhG4us8iJN0Qd8zeFAgfcp9jO1O+6CJ0JnTw8FHLIflCrImUyIgNv3SqZGz7xBRJp9gJGXFvrwAIS/mQ3p+tv/o+c9sQ6fEj3tQV5PHBO/+loNup4YUVBgvKSJdOuYXtfaECwWUZv7b2a8MPFCDbracC1CgsTpD840wfxCNT0d/mahXxIxoZpPzXcVlJQObjfEN58g7tUBXUiVDeA6BW88qVOpXpJsshZs2kHese7dHFoIfsJs4jICWgkTI++ByQaypHKjDfkWQaImPyQ==
Received: from DU2PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:3b::17)
 by AM7PR10MB3173.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:31:58 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::8b) by DU2PR04CA0012.outlook.office365.com
 (2603:10a6:10:3b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 15:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 15:31:58 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:32:40 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 16:31:55 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 16 Dec 2025 16:31:54 +0100
MIME-Version: 1.0
Message-ID: <20251216-next-v1-3-469e1d901920@foss.st.com>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
In-Reply-To: <20251216-next-v1-0-469e1d901920@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AM7PR10MB3173:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7899b9-48a6-4b20-db0c-08de3cb84054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjdNSVgyYnZoLy8vdVBydjR1SW5IWWZCeDVkQ3lpa3RyU1F4RVp0cm9mTHpM?=
 =?utf-8?B?SmFyN3F1a3hpU2J2YTQrWTRuQkI1L0pBS0NMaFQxY3RQZlJTUEcvc2J0eEFZ?=
 =?utf-8?B?OWsvaERuSy84Smx2YjZoVnpoeVBkYlpTNE5rTTVLdHU5dkNGOTVxcFBVOVJN?=
 =?utf-8?B?b3NsMVYvQ3crZGZIY0RZZkgwMTFzOEJoRFUyckhCZ1RBUnZ2dm5POE0yOUhk?=
 =?utf-8?B?bk96N01rZmRUOXk5RFdwTnQyVCtaUGdBZk4yOVdEajhHOE9yTE9Hd0podHJO?=
 =?utf-8?B?L1JxSWxvOE5tR3FyeUFGTGhrK0NYNURwRzFCSytNb0UrazFXeGRLWDZXaTho?=
 =?utf-8?B?K21Xb0M3QTlzYW0zWXFJeWhwSHI4YVllRkl1NHM4T2F6M1U1Nk1DNkVqR1l6?=
 =?utf-8?B?K0d6RGVkUW5hK3orKzBrUXQvZkZ6Y2szMXVhTXE0QStYc3RaL1o0WlJ6NVMz?=
 =?utf-8?B?Q1MzZnBKcmE5RmdnQlBQSlpOYmN6MEx5VWRrOTZnK0c5U1dlQS9pSnc1Qm11?=
 =?utf-8?B?ZzBNaWE2VkJ4Q1BkaUZtN3NNalJ1UkhuUXVtMmZQUzZVZ25Sb2NLZkUvSmcz?=
 =?utf-8?B?NmxPYjRCMURNQU5GcEFKbmRJUFdHd2oyUzFuU1IxbS9vYnpjRUduMU8vUnFX?=
 =?utf-8?B?ZDc4N2QzV0NNS2dKNlZSY3RxZ25aWkJLK04ydytDVnRiYzZxTEczV2I3U2pR?=
 =?utf-8?B?SHRqODJXN1VBZ01RekVNckhZellmVUYvYnE3akt5YkE5ZlY3a0RQV3hZR2FD?=
 =?utf-8?B?U1Y5U2RtdGRTN2NSRHhWbXFNa2FkL3Z1Vi93NVdKQ2JsdWllczBxUWo4dTV6?=
 =?utf-8?B?T2tLeWo1cmR0d0pZUWp4YUVMdFpnVjUzeEU5MmVYbUxwNWNvR2dLdGVvekRI?=
 =?utf-8?B?N3E5VUxja09OWHd3dmZKTWgvdlhUTEtlYW1welVVL1ZTdG5OQW1FNVVOQkhu?=
 =?utf-8?B?RzIzSVBNT29mYWVJYkdFKzB5UE0vMS9sSmJPR254RUxESmNzWXo4VzMrdnhr?=
 =?utf-8?B?L1FVaWJEV3ZRK1VmK0NzUFRiMzluVFpHU1lIZXF4VFlieXBSbHVMMnlTRlZR?=
 =?utf-8?B?ZjVyK1dOajR0NGV0VDgxSEdkZUdpbVkwNDkwRzUreXY1R3Z2dE9YMnFtSVNN?=
 =?utf-8?B?NVBFR2pjT29nTTBkRzVaOTJqZnllN0JGTUlLODJEcnMvblRNQUtGYnYwVUFu?=
 =?utf-8?B?TThZY2c0MmtWYTFRNC95NWZWTTN0REl6ZGNGYzhTTmp3WVkrTlovSUVudUJ3?=
 =?utf-8?B?TEJ5M0tKWmptQ0VvZFV0dGZuSWFhWjJzYTVJaFJ5cHRPdDZvU3d5U0VwMUJX?=
 =?utf-8?B?VUdtRURGU00wWVBzZU16azh2end0OCs0OFNkQjZKQ2NySFVGazlNNHZRd3Yr?=
 =?utf-8?B?SkNmZlpkU0pOMVRkdjEvN2haeUY2RWxvdTNrb0o5eHp2SW1qeitWSlJ6QUdY?=
 =?utf-8?B?MjQ0dUMyU1RFa0RCSTl4Z3pONGV2d0xOUWJkZlI1VFFaU3NOSmN1ZlhmSTZH?=
 =?utf-8?B?dlJwMm5DTEpRbmY1ZTdqVmJwYXJGb3dHUGtpS0Jxb2phZXRFZnJZQzRGSXRX?=
 =?utf-8?B?TjkweXV4b0w4UzZTSEpyTXZOTk9SZmFMSFM0ZDdtRm04MWJkWnhKdFpPTG5U?=
 =?utf-8?B?TXFET0xGRXl1WnRiNzViRVkyUkZkUWNaV0ZBcHZINlVIdGh0YkJCWUtlbmcz?=
 =?utf-8?B?Nmhzc0U5c3krTzQ3NFhsaUxBYnBMaUlnNlhwUm1xNW93bnoxZWlja0RvQU5M?=
 =?utf-8?B?QjVCUmxUd0JUdllZd0ZiN2NQT3c3K3hlQklJTktEcGxkRjAyTWk3N3FYMFIx?=
 =?utf-8?B?UmVIekNCaTJmTWhDbUh4bmQwejBYR0N0RXk1VU00QnR4bDd4cVZjS3NVU0lj?=
 =?utf-8?B?VmRibFdLZG5lWDlQS1hieWpWUVNJR25ITnJIV1cwL3o2aE9kc1NBQStTRzRm?=
 =?utf-8?B?UU1hSTR3K0lXdjZkZTBTak82VytHU1BZYXQrYXJ6Q09HVFIxaytscDlYelVj?=
 =?utf-8?B?QS9JOERiNGZId0ltdEhMVFRxd1BITXpwZnlYVVVoN2FlWlhJMTdjWmNDRXB0?=
 =?utf-8?B?TEJHSzlFVXp2TW12QWc0bmVTeXZtTCtISjFCUVVPZEJ3eGxZTzloL2hwMlg1?=
 =?utf-8?Q?0Mlw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:31:58.3056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7899b9-48a6-4b20-db0c-08de3cb84054
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEzMyBTYWx0ZWRfX/QKbOveFlHWw
 vMqclxfOcI8YrYQ50kIb1bmRTYMHknaaRE2NInKDraGLiusIpjq193bXWDM8/pPOqgX3xfas/Pw
 u2wmtGm3TdOtLyqpJZycga4py5xBon32rOYm7g8Jur2MJhX1U/N61P/CPLAfpL5L8BFCIC7y/GC
 AD6R8X4snfyHGYlmBxQIrFAe7iX221uurIMm6psu5dhCHEioe5+a+ywLJDlysUNCOAMXXwezpOu
 pK1X449SrLUvFi66xRQytrDVT1VM5dN2FnodZdBYZIAfzLrwtcwCWIkfnxVXMteYkuQlkr7ZEme
 fIQFjDVM8T6tbA1CoMlewz0davjFooYsCBGnu04V7FCK5L+Bn7FQPJylqHVJJlnv5K7R1XwCbrZ
 NocGNzEEKLmZETupfuuIGShO5lDC7g==
X-Authority-Analysis: v=2.4 cv=AtvjHe9P c=1 sm=1 tr=0 ts=69417b73 cx=c_pps
 a=a6vlzZaZuUzyAnil8qmsbA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Y1jhug3KDOzITNdQmOoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: Mk8ULoNp7BUDAy7U4ot1VGi6yOyWl7WU
X-Proofpoint-GUID: Mk8ULoNp7BUDAy7U4ot1VGi6yOyWl7WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160133
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 3/3] spi: stm32-qspi: Optimize FIFO accesses
 using u16 or u32
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

FIFO accesses uses u8 only for read/write.
In order to optimize throughput, add u16 or u32 read/write
accesses when possible.
Set FIFO threshold level value accordingly.

Test performed by writing and reading 64MB on sNOR on
stm32mp157c-ev1 board:

          before      after    ratio
Write :  428 KB/s   719 KB/s    +68%
Read  :  520 KB/s  3200 KB/s   +615%

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/stm32_qspi.c | 59 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 1778f8c1458..a02e0999ccb 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -50,6 +50,7 @@ struct stm32_qspi_regs {
 #define STM32_QSPI_CR_SSHIFT		BIT(4)
 #define STM32_QSPI_CR_DFM		BIT(6)
 #define STM32_QSPI_CR_FSEL		BIT(7)
+#define STM32_QSPI_CR_FTHRES_MASK	GENMASK(4, 0)
 #define STM32_QSPI_CR_FTHRES_SHIFT	8
 #define STM32_QSPI_CR_TEIE		BIT(16)
 #define STM32_QSPI_CR_TCIE		BIT(17)
@@ -162,23 +163,42 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
 	return ret;
 }
 
-static void _stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
+static void _stm32_qspi_read_fifo(void *val, void __iomem *addr, u8 len)
 {
-	*val = readb(addr);
+	switch (len) {
+	case sizeof(u32):
+		*((u32 *)val) = readl_relaxed(addr);
+		break;
+	case sizeof(u16):
+		*((u16 *)val) = readw_relaxed(addr);
+		break;
+	case sizeof(u8):
+		*((u8 *)val) = readb_relaxed(addr);
+	};
 }
 
-static void _stm32_qspi_write_fifo(u8 *val, void __iomem *addr)
+static void _stm32_qspi_write_fifo(void *val, void __iomem *addr, u8 len)
 {
-	writeb(*val, addr);
+	switch (len) {
+	case sizeof(u32):
+		writel_relaxed(*((u32 *)val), addr);
+		break;
+	case sizeof(u16):
+		writew_relaxed(*((u16 *)val), addr);
+		break;
+	case sizeof(u8):
+		writeb_relaxed(*((u8 *)val), addr);
+	};
 }
 
 static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
 			    const struct spi_mem_op *op)
 {
-	void (*fifo)(u8 *val, void __iomem *addr);
+	void (*fifo)(void *val, void __iomem *addr, u8 len);
 	u32 len = op->data.nbytes, sr;
-	u8 *buf;
+	void *buf;
 	int ret;
+	u8 step = 0;
 
 	if (op->data.dir == SPI_MEM_DATA_IN) {
 		fifo = _stm32_qspi_read_fifo;
@@ -186,10 +206,10 @@ static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
 
 	} else {
 		fifo = _stm32_qspi_write_fifo;
-		buf = (u8 *)op->data.buf.out;
+		buf = (void *)op->data.buf.out;
 	}
 
-	while (len--) {
+	while (len) {
 		ret = readl_poll_timeout(&priv->regs->sr, sr,
 					 sr & STM32_QSPI_SR_FTF,
 					 STM32_QSPI_FIFO_TIMEOUT_US);
@@ -198,7 +218,23 @@ static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
 			return ret;
 		}
 
-		fifo(buf++, &priv->regs->dr);
+		if (!IS_ALIGNED((uintptr_t)buf, sizeof(u32))) {
+			if (!IS_ALIGNED((uintptr_t)buf, sizeof(u16)))
+				step = sizeof(u8);
+			else
+				step = min((u32)len, (u32)sizeof(u16));
+		}
+		/* Buf is aligned */
+		else if (len >= sizeof(u32))
+			step = sizeof(u32);
+		else if (len >= sizeof(u16))
+			step = sizeof(u16);
+		else if (len)
+			step = sizeof(u8);
+
+		fifo(buf, &priv->regs->dr, step);
+		len -= step;
+		buf += step;
 
 		if (!(len % SZ_1M))
 			schedule();
@@ -383,6 +419,11 @@ static int stm32_qspi_probe(struct udevice *bus)
 
 	priv->cs_used = -1;
 
+	clrsetbits_le32(&priv->regs->cr,
+			STM32_QSPI_CR_FTHRES_MASK <<
+			STM32_QSPI_CR_FTHRES_SHIFT,
+			3 << STM32_QSPI_CR_FTHRES_SHIFT);
+
 	setbits_le32(&priv->regs->cr, STM32_QSPI_CR_SSHIFT);
 
 	/* Set dcr fsize to max address */

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
