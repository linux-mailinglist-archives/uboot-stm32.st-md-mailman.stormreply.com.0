Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E49C5E346
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED93EC62D46;
	Fri, 14 Nov 2025 16:24:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D483C62D36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGMu0R2679024; Fri, 14 Nov 2025 17:24:44 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvrb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:44 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAMEU7s9AhrBAw/4RLaoXD5nTYzriYOMJK/hGryViNQU+fzrfoHZe8XC83goEN6pAYJPYedzecfV5WnUdz06Jr23OvHmKHaOjuzLFK9nhKdRVjnWK1OR0BibvWgRV32inV2RnO4UwzEykrtjsTiL83Bj1phZeo+zhUetuzkGNH4IzASbqIvlQEStCIhCU1DYiFoSAPIG+gTgevn/sWBB3cXlQh64nHREsv9GQBnXJqzLZMIxqcqq9MAlcfVqP102r/vjm11dV36hIg/9sOtazM/Qeu+9St4qT1ITAIXiq8wkJVYdxxD4cajKKAl/iW6s+SOFCjt4dg59rTsKSLlIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOojEEcg73zAxkXwMi+B6V6w9WZFSDUlO7MpSdzbS0g=;
 b=qALXPEM+Nz4ENrKP9qjBJSu63+XKgHI+MckRJ8vUuFuA4Y3s9245FV3it8Rz41HzWphutddGJmIRFO88LI5DVPSTLGOc6v6Me8e8fDOgSS2O/gUsrOFMqypZ3QLBWuHBk1wL/YXlmeWs2agwr6KMhd/Lr61Mw7ra1yEGUUSFu/QH7/SKrgQeGwqtKcfWDUBlsiB56a0KywPxT4P9joAOa0qBrb2VoQQFUFdFiS4398/xGhiGza4eVGRhRNPPz4ImPSAlongKLgPgIGTsRZg3+CxhY399j5NhBcCyqbjhss21Q6ngo/mk7UYXHm+NOVUXof/rcyTNGjlIfWwl9hvzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOojEEcg73zAxkXwMi+B6V6w9WZFSDUlO7MpSdzbS0g=;
 b=ZJWzw3i4WoJnDR2GIYyeB7eFC/DKgEeDmDuiML1nFH7XQODsA6o0+uyRdpSNLf/gAjx3lj8TBmxGvcepWPG9a4Ijnw9ibCwC+ENvfIQGtMtdYlKrPI94yv64ZkvZNG53HrAuLo6Y4qlouEvHVNF01yyxiM6At5zlWoRtQrPgvdBcU+oWkxEXxrfDo/K+S0Cb4tUnw+RnprFADzQoGAwT4GxqCOtkpugoQH23j7ZOtqSkD/dRAdnpw6eiBhjwHqkVUjVFEJeIlEQOYPMatMU6wiKj1YifH2reIdJlNM5kB7sBwld3e7wXdxoy3DRG7mHRX+RCNGMIkW6Ai8IjSlQc4A==
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by DB4PR10MB7421.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:41 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::29) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:41 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:53 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:40 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:57 +0100
Message-ID: <20251114162417.4054006-24-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DB4PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: d78275ed-cab4-4e4e-bef0-08de239a506d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W0g81EDdG+dPK1iLtpzBlIwXpsIw9xaoRzPZIt6FmsIXQ4edNjs8V1h8kTwb?=
 =?us-ascii?Q?eU8c9RKeHAerJPazlqSFJcivv4e/dNcOhaqjzciammLDPrEk6BLJ/oOt3dyC?=
 =?us-ascii?Q?Gemm/PBkQRDPcEVnnzqiSy5Zup+67UmzOn0VAWsRitEpUdTcreDN3LZCrdww?=
 =?us-ascii?Q?wQYhvKTurmv9o/PjPsSqCLpLcqZLqUH0upxbLUlHbVuQjUFa781cSpIUI4gH?=
 =?us-ascii?Q?Qluyv+pNB96SZHBSGLMX6EkCnvZC0pyGzQ/ZKhAtzelJ3bPzYS6WRwdOPIb7?=
 =?us-ascii?Q?nIxxC7dSQygASLtg+7D87+FEd5VAmQJsM32gnWYoUGrSEfbSiRRYo/fG7Coz?=
 =?us-ascii?Q?u5GIGH2qE4X7XRwJs7E6A9Ilu/qhM+KtWU2D7amzeFYnyckWUmj1nyPOof76?=
 =?us-ascii?Q?jWCxdJeONk63QN2OjikATBNGk/Ca9VlBuj4lYcvZY4ty6RvjPTpT2ESRBGNp?=
 =?us-ascii?Q?yPZJjvXEjorgtzOWF84NP7j/BpHwcVrQwGBEyBnzaiV4EACAfuPB7M6AtrcK?=
 =?us-ascii?Q?/dABYuQYgYrR0JbsZkaMo9+oQQ9m2RrFRDP/73pkEYnkrY5v8kIXgw9fOfdi?=
 =?us-ascii?Q?yxNZxdcHt+Hu1An6o120ViVTzS0ahoQ/AJOCbGHr5Yxbx/iJg3IiNpucRFwj?=
 =?us-ascii?Q?QOrUNIrMV522j9EFbxSyfyhcGd6spflqCPOFac3iHZB8i5ZNUidHYqsMFpRr?=
 =?us-ascii?Q?/vZrEBYonsNkLme/M5HR8OwdrzGz0GsYbqKFiKnfr+8WT+xqd2Uu1rZ7WF+h?=
 =?us-ascii?Q?VfvrsD/2Sq0V/1g6klv67UGZUfqpn3LVdXJqAMRowgkV57hyhgg3pCvHjJbb?=
 =?us-ascii?Q?ZJdoBrwiBdDT5VnXKgvFTzyowsWE52x0nw9pC5FnBQT88NnkWQXTDI+wDWIq?=
 =?us-ascii?Q?pyUNhFxqzHtcC2lk0qFR1SjCE99yedHlNpqTbMPKcksRwfkOST51vjfmv2YN?=
 =?us-ascii?Q?NdTaZxBtTgXBvmlUJIqClU7TRhMUq9BecUJvAR9zVQe5sLansTTA6F/YoEtl?=
 =?us-ascii?Q?6g+DyK7q0Bvcm3AVK1iv4PyIO28rgPUA3juagtdmm+GXLRGY1i83yhyZ/JiN?=
 =?us-ascii?Q?3WVQx4eshwKY/UO9axBd3r210zdu6EFnTXaqm5A3jdy1ev83IyrdwjIHrWzS?=
 =?us-ascii?Q?I3ZwMAhNCmQaZuYk7TVBKyqYxKC01krG/Ir9NfxvVQX2Y3rTucWUsRWkMZs5?=
 =?us-ascii?Q?QBfS3peboHB5kc0tBmBwtRNFNhgeOmFNNAn0IRUvJIVyLM/4W/cVFu8AbYSS?=
 =?us-ascii?Q?cFxQ0/Wml8ObhhNUsJmEs2HP/in0FIwBwNWneZFDY5QAtAyyN+z8YquDu6sq?=
 =?us-ascii?Q?Krs/TbqCcbk53LIBwLoNu++zjtUDnfH4xcgkyCbIoaWlN9uIQMAh7gsOtchY?=
 =?us-ascii?Q?OKerk78NX38K+pPNjLwxg9PD3O4yjqiNhnc3En2Qr45lICqZ3EJR2ZypVICd?=
 =?us-ascii?Q?r9nf/lZcrQOBPsb12hhCyh0/NPB+yAWzf/3U30OO9h90Rahmi8dHPvEsHv1X?=
 =?us-ascii?Q?Hmutf+sknw672BOHFNXBzSNJzWXaXLd5oqP4fp2Me+4KsdgcTqy0BNSbwXKW?=
 =?us-ascii?Q?DOIdZmKnwynO8UfuLeo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:41.3645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78275ed-cab4-4e4e-bef0-08de239a506d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7421
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXwljox22iIYjU
 PBUyi9MaYe9EFEqfOKGfoTDjc/R35flQksulNeq7eWMxA6R0fpayxCRmEEgMxSebl6T0+0OXugo
 ksHoEgPGk66XGnuyN5UOgpIOywyrb/2O9wtkS3fHPPN0Z2ZVRBZCsfE85NzMTe+t3Q6ynd6JtPI
 nNiKEEUgT+XGVpvY3M4tEotj+jfprDjVkCq1NXtf+DEhktJAtAAAsPe2XJaGzsjqOK/KTAqO0x+
 iNyKi27HNytpPRKA1FTHsSoKhgvOJ7qiBqDWEFyX3G+eZi38xTtFW39lkLkqs+ZUey0hTeFVje8
 edGyiTnCDV1XKdBtS/neJWnrsmJ9GL6GYZ1OKvdJe52neY+SUiZ9+d/omrokuYYveATGXf2+Lho
 Qx96NasM6Airdju0T8px6YpASRjVHA==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757cc cx=c_pps
 a=wVTwu37gIAg1zhyz+Ju8KQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=6mhu7dXRSC5viyVqVJ0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 5zv_Df_GZZfapJBAiLpU0uQ819HXJy2A
X-Proofpoint-GUID: 5zv_Df_GZZfapJBAiLpU0uQ819HXJy2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 23/23] ARM: dts: stm32: Drop "u-boot-led" from
	stm32mp257f-ev1-u-boot
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

Remove obsolete property "u-boot, u-boot-led" from
stm32mp257f-ev1-u-boot.dtsi.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index 7bbb3e00351..b70cd8b52ce 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -7,7 +7,6 @@
 
 / {
 	config {
-		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
