Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02024C5E30F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFB76C628DA;
	Fri, 14 Nov 2025 16:24:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06F8CC628DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGEjC62686620; Fri, 14 Nov 2025 17:24:30 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3rmp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXbnrquBKIr5gYIXRcHoXl3RA1UCXWQ58RXgFTJVqVn0tbu8+j9OCSIf1yyEu+Gdk6OsK+GYKqPc3NcvZGOun9KdJtt4C4A6uLPuMHRKN/H9lwJB8fqmEXTiLEbSv0VbjDNsGsoRo5ZIk7LEhpSAvf+2TkvBGI1+Ar6rKwHRn10zLcCCEOaIMOLoZxZSV8c0s9yiHu0kUkjva/Ow9lm9OlzkRipTpFAUZquyDQyHhAjtTEsrbFC+9+gjqVeT/TNxcaIGdCqgv20o3J0U+KOVzAth0WrnAZgaScIJsJikM6ZtolRetLx5NmhI0QsZVo+J4dA6h8tonj9CwVlz/W74Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toR1EJLiGuVYTYafuP4yr7QIrz3nInkCz7c85nMxzBg=;
 b=OWlfOIlVUXpIjwJvgGP3nacnnuAk7a4DHAAf0+cOQLDcy/D8oWAYVet2Ae54br/y9ouvmEVOSMxgzWpogk76FdLHrveFIdaEZgSNPYY5W0jdr1ih6pj1c5KA02LNubwwZILjZzxHJmA85aSKptOlEqARPVHBesSZqC1+p+8oP3ykw65yyW3T0xFSmmXVOP63weQDDN9klEUNL4LligISvCm8z+Vnah0TqXHiVZYk5lgQNpLxr6vY83KMuLzpAsUP6NmlPt1Bxk+s7SdSuQ8esiAf1a1HKCv0TvtrB1wwG+K1FS6OrLat0mYJc7fA1JCYO2oh8lna66qv8uQceHPTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toR1EJLiGuVYTYafuP4yr7QIrz3nInkCz7c85nMxzBg=;
 b=MIX7BlQgh+mCukQpWeoW/rfo/dzn9ZayjDfJ/+yKC4/FgANlnxp/eq2juLIF6/3P0UCU0+NDSVMINJug4wODf72SNizWx9mLmw39CGlkrHyXikOxDz3IqpRDJG4G+XM4FZWpDHypA+Hdbg3ZM++oIGx8vWGM8F1ARL7amfM+GB+t0/4zn+Do4Inh+CipvIic27aMoXf/IMJxUwyNVJGY4Ms0Jey0SU5SsuP200NrTCriuCuD/exl3IP76PJcOR9NiB2Ajow8prt7GpYqKpicVS2Bh6X9pW17QOEJuIyX5RLiqUdz6HbHaLfAeW1b+04QdvV/p5yu822mvuFXQV2M4g==
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by DB9PR10MB5138.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:331::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:27 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::f3) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:26 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:38 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:25 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:40 +0100
Message-ID: <20251114162417.4054006-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DB9PR10MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fc1f1c-b169-4e88-23ba-08de239a4750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6FNm6spaF0zbfRua/Hbh0gzT6cf1rZRMdo7pZ1h0ntjK2gk8sJi4j514zkZ0?=
 =?us-ascii?Q?Fs+YlLr86UxC7dbQuXCQmnBANDLT3TA1pzB4TrzbNdbM+o14/kJx8k4fK7yY?=
 =?us-ascii?Q?Qltv2KurFSMFM4lemQPfNQ3/c04zE3zaJM5sOMzLOTbMtcHN32qafDCnOc2a?=
 =?us-ascii?Q?Lmvuk1vfLNR8IuRoLHgVumJuP5k5FOSmUAmen+qv/4E7SP/s+4oAFJ1ZQBOm?=
 =?us-ascii?Q?aOQsobTSmTU+ijVh/4m6n4eyG2Q0iHL2/9J9p2uQvNtH7KrU1jreTaCgKUTT?=
 =?us-ascii?Q?Na1/zVtFc7Ty5X1oK5GYPkroGLybGcHmi4DU6FmORDEAkZpfOOpnhd7MSBpt?=
 =?us-ascii?Q?LTI8qvoQjBlTCiQjT/J/CgrfGtnwMIne/Gmz0kPMLshJDwlUzGPLDsglcBls?=
 =?us-ascii?Q?YQNaTs/gY/DDT/LwDm0y/2tJyxdGYaWp0JcrMITIQLa4asdDkB96phUC5zyW?=
 =?us-ascii?Q?M0KvA2Q3gABKK/PfndAO2DLervdHyd/FvXD/hamFeYNgnv1FL1fLLgYuitfP?=
 =?us-ascii?Q?X5Tp+SOTuJTGBmNFhjifGeRkmJ2mq81V8/IhEx2qMymIHrFCazuY5z450f9O?=
 =?us-ascii?Q?SC4nl83VtvMSJ3eL7vbj7xOyGef//SIdhB3ZZ8skeIhwGI5S6TFx6s2KWgbL?=
 =?us-ascii?Q?7rO4hdxqdL+nEFlWsr0X1RzV1bZbfT4SVA5YMI+lF66PuutrDto1MBsa7vde?=
 =?us-ascii?Q?zxlGZVd2lU5jfsOOLKS3Ep3ZUMPs87QWm/b2syVR7r7AsXZT1RRUBANaYPlk?=
 =?us-ascii?Q?F5t/wUDeq1bZvz/pLJng2NIMgB1PuAmQMfmMwmCq9t0CqxzqTVqmTpyfM7nZ?=
 =?us-ascii?Q?luhyxTC/26XIwH0e4yhRSHl5i/GWbFtSrruAOdRXOzdcxApD1l1iSj5RAYgc?=
 =?us-ascii?Q?ri2gB6pY2ztJMeJbxvqVm7ocxjefi3fM3y1uOefMOQ5+638odFMKiE0mdVaT?=
 =?us-ascii?Q?V2xfAlxtsBH4TTdIxvXo8KrRNoKPzg32g/RK1j33+1nOq95GTburROjFbdZ7?=
 =?us-ascii?Q?4+kZwJ6KNt82PQb15qqItGZ7B4r7NUq7LrDvLMlJe8C6cKRmpseFILX/gluO?=
 =?us-ascii?Q?kf1OrLrStvcgqRcqdcKRDoRiXjSn9TNnThdGbdNeUZjs0qLH3DuaF74NeNG8?=
 =?us-ascii?Q?nBD282FmHMW4I/rGqn5gsr7FTTOT2ElAjXJcJnqsBirACilaoGIuyr/HNHbL?=
 =?us-ascii?Q?OyyH38uCtR3wh/cbBm7yuxFL8POBNRuYnp7k0KpeMDie96OV5gdIq9fTtZUV?=
 =?us-ascii?Q?VUN+Fz1y/j0nLKkkpXm3PNsZpuWkFBieJheoulotDiznsfoysdUHsMtceyVf?=
 =?us-ascii?Q?5HIAG0zBUEHK0l2ST+nvpCEtJdAGP89ZVCmHJyFnmTETqpkRBFHWYnL0BT1u?=
 =?us-ascii?Q?9YvRVjlJpewDHAHdRiaJrla5yHWUEMzXcXkdP65FkbS0Pm8uOFHEh0cNbKEU?=
 =?us-ascii?Q?itw9Tsns1M52/rOidE9rHBksvegs7IZj50zNV8t8TTgQOzi/Vl1okErg24sy?=
 =?us-ascii?Q?9DX0g1+rKdv9LuEz3UZ11jIyqwX12Q/5iaQW0X1nOeoC2oMHQ5V4USGB0Uuo?=
 =?us-ascii?Q?hb3O3+64Zx/QTFBIiJQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:26.0706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fc1f1c-b169-4e88-23ba-08de239a4750
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5138
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=691757be cx=c_pps
 a=bW01r+i4nfEjEKc7hG5Png==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=buHG0PgQGfsINSbCN1gA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: GklxNGuHcAwF5vba0QOS2QueISz1mUf6
X-Proofpoint-GUID: GklxNGuHcAwF5vba0QOS2QueISz1mUf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXzcvmzvQNa+uZ
 N5JiOu871Jg3Ex1Jq5ijBlnaWBWQJ02Ywmn6e4W8S16vWyxRbnG8v7IVQCvd2K89vm0DjfZQKqX
 pW8enOVWBZlLnQxBVptHsP18m1oEL1el5VMIKx96W/MvlY0vyXBl7zvV24jEpesaihYeBUxCJnb
 vQWgD/7ajIc6J7W7KCf5V8OxmZDta48tbOwgvr/kMYmlTn7SlXFaV6xGNldRxsHQiS0JoJZY0G4
 eH1AmBHUmtI2/m1EQWmXnu5AcqpfzBVw8axsB8bjwm9fMlTdC0CoCyewxkGYIHgEZrbYiZqljuf
 +SmyhWb/+zc5g7Ab8uPw7HV8SbXpPSeEQoPiOf87xQadVdXYLM6WPqHEu737W5uiJQckaLnvvfH
 8PwQj9aSvMUMe8RrjuNRmVy1QcJPuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 06/23] configs: stm32: Enable LED config flags
	for stm32f746-disco
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

Enable LED, LED_BOOT and LED_GPIO flags.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f746-disco_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 1e39569c055..cd601e72791 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -37,6 +37,9 @@ CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_LED=y
+CONFIG_LED_BOOT=y
+CONFIG_LED_GPIO=y
 CONFIG_ARM_PL180_MMCI=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
