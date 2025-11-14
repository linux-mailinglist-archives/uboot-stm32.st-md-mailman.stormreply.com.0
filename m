Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA69C5E329
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60A1BC62D44;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140EEC628DD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGLOs72546206; Fri, 14 Nov 2025 17:24:33 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ae4y8rqk9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAUrXJfiGv0SM4Cx8rr+9Je9YboJJ12qZSJ2hdNz/wpP22uM/RqBAiJz8zfHgzbJxgRELtonXPuhKIWsmIm1OU8KGlJBczSm27qgSvFclxgk2/sbnb9eztTWgBk2NN/gKgrlhBshEQ4wRxCcEGV/T57LCH96wmAmwQSu3Ynol+2pxllMN/BRM/h/5XtlKpMnOzNwTvG7HnjkltQ+EbfoiTdjGNM2E4C5t4V6NwvLK+i/3Uqt5DFhY/1QHgw8bT+0MpV1jYgGWdQnrY4w4butV6h9cAOb+8Zt3kvQYNMoi1z1bhzs8574u1EYlFOyfqDZBsD4/D0MBRs9o8/GA10lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3evPSFtnoO6nsnLEngSX2a2bK5B/qbobvty/T3eSjI=;
 b=I5+XUuHiOdZNzALzZD8G7PfMQkoP4N+dCerY/KEiljGb0yfsxKmFwqJxBXQwBi+YRBGo9KrMbsqGP9siYJTEy1eStZ1HwuPSxM/3u63FLh7jZphbWAF/ou6m0ozb/rgSSm4z9S/xfjaSemWZeBAJDYhzO52NaeZ8Jrb1l0vOwU6Ig6GEFrpfUSdH6dCFdfE+qtSrM1hels9a1FRRxij99ytAQ/XRB+L8ls8TrL52oz2RqDkax5jSNWIhA/pwpv+Kr81RjuYnSzIVWrH3DtEVaNlUBUp9wxUkegxp+vV70+GnHo+WN6lcroAsl8yUpVibIVdt1Mk2yztA4cB9PWOdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3evPSFtnoO6nsnLEngSX2a2bK5B/qbobvty/T3eSjI=;
 b=iHgp9LEkRatJdfumaVwMUYBRFYGrp/GbolrSC5tnFBaWRXoQzf3x8iG5VQSBIIajQacy64HWl3RwRLgIlOWIKSKEKY7WApmMZAcY+rIUmySINIajOAgXBjRE5H4y7e6WtxZWZ+LC7lv/txQFJLNvgYs+mqngIc/8fBfKqZvHE1/Cn/hSRh7TTeLJOxOP802s8dKwmPUe1J2wxD4mNxfLr55Thr2rz1GqFu55IT7P762FMz74u1liw/vMA4sYX8GkNePBEeesgMoA2eYu0M/IRZFEOAWRr3Wy2nXd00e0d2dCnV1y9RZqy+ReVvIpE3BxJxu7KEM/otPIg2RfRdOEZg==
Received: from AS4PR09CA0004.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::10)
 by DB5PR10MB7821.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:48e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:30 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::3f) by AS4PR09CA0004.outlook.office365.com
 (2603:10a6:20b:5e0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:30 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:42 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:29 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:45 +0100
Message-ID: <20251114162417.4054006-12-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|DB5PR10MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d437143-c3ae-4758-d3c6-08de239a4a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aako79ZinbBhpRSrFIdfyDv7uoAS4485KH7CwstAyDAwZhLX8qfgVtu68XC0?=
 =?us-ascii?Q?UGau/UjKJd6ejxkQ3ZLI+J3r5JdjYXjNXo7yFJxAYKkGvj9oqKjDZBncaEJ2?=
 =?us-ascii?Q?7RfAAtzTlM+dqQ3QmQ066fLMBJTshO+b96OQ6cXWpeGjntnGAXSwohvCjJhD?=
 =?us-ascii?Q?7+0keV2oUekH/YMrJUV6OfWNMZ/DvUWs/HkplabxAAW6ZejAG1XPBctmXEbV?=
 =?us-ascii?Q?I129U0F2yYz2qZ9K1CFRLkb9wrYyO9Fu+P9tlR+QDELyOtHQgshQJBb8ylSw?=
 =?us-ascii?Q?2KUWvMhmSzzLaLsRXeqFzoAQD9FvNVFL3fUt0nnbsNsomAY92tpSe9MDPmWx?=
 =?us-ascii?Q?4MIzHwLaDyYs740LuT/piFW8T7MFupp7jGZJsyZke8s8BrAHSiTaIZQkL7w8?=
 =?us-ascii?Q?MGtlybh8ugqR8nP/ZYkyQwxBgkdrMD0N1kmUkJxZoaJZFBV2fu+ynQylvRfe?=
 =?us-ascii?Q?xjEDqsrZNfABJ1hLsdwyp9pOpdGTzaVPab1RPV9hJB2Lso9AgA9x/XFSe4VT?=
 =?us-ascii?Q?okS6Rju77OeBNwJVSi25apy2aEIikeDr5jSHc+n3iQ8R+SF49waz6HuIF4tN?=
 =?us-ascii?Q?juNwM6GX0feXMsPk8KMAWzT9A9PWy3vK6p2x1pE7VFpyyU3TlAfaTt8T/xoa?=
 =?us-ascii?Q?5e24dsZJxyvuXwjpEPnK3nwowMkEA+LLWo12pSO1TJxmOWcShbtCA5XFY3zo?=
 =?us-ascii?Q?mlEunoGaQtoOLmzhfurRh0CUsv0DXa8IhrQNxTTXzCln4jlOU2FSRSesEBRJ?=
 =?us-ascii?Q?NdU3xD+qduNeMhBN1fYeJdiLVU0QrI7Rf+T9LdghHMtpm3Pzy6vAiTgI4SpK?=
 =?us-ascii?Q?Kq5lZ9hfM3F/D7LB3OyPdQMPkJ2nHCRcPaZT5GW+K/kzm0Kw5DhaR2Hq4C6T?=
 =?us-ascii?Q?oY315jBs/nz1by45QGfZTYvwMGc3SB0gOxR2as3IrXdHw+QOH+dLnYDhfr2t?=
 =?us-ascii?Q?z+4rs90KBtyvP1a12UDh4sNvDJBfuBdude0zhVMcc6K4tpGqRiBOmDH5dl3P?=
 =?us-ascii?Q?HnF4ZZwp16fC9xzXZE8NmUISHSzzK2pgATVZT8gdZ7/YWCqjxJrrRt14BZpn?=
 =?us-ascii?Q?MLRymkL5fGV8Gmgnhe36uYERYjH0GzMuC+MwO4bLUOG4M0F+9NCv3uD1bUBX?=
 =?us-ascii?Q?PuXWNRhFQT+3I9glTYwl2iAf7HeJePj2R6AJffWC0EL+tXbyU8bQmVPdpSyb?=
 =?us-ascii?Q?MO4hXzGGUlHYxf1nUQa+2IVn9ybq+nulHE6K+manlPJ0euBwhYXWBjYwArXw?=
 =?us-ascii?Q?zp/CKWwhva4wQ58c+wQYh89ymLNQ/iJc9c1I1R0mXthEn5Iczvl+IknvZaC/?=
 =?us-ascii?Q?YSLQVgs+xhXONCmYWsaiF8H+UyWTpVved6p6ud0ucE3SiHw8iyXIdYKhd8O5?=
 =?us-ascii?Q?kFRbtkrrVV4RPCCQ9oya2dAiSICoMVxf9akwf7jPu6n7/tKICh+ZEvw0EaBY?=
 =?us-ascii?Q?nlNn5n4ps97Hcr3IT3PNrSypYbT2lvidWf/dYw2X1vfZCii/0G1tKZkxtP3Z?=
 =?us-ascii?Q?hbk62sED8iyXTr3zYTnBOyCFC4RqH9vVMQLUS2zA3pieSSLBTZbVHz29+wfw?=
 =?us-ascii?Q?ZoUiTTPJygljiRarSNA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:30.6316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d437143-c3ae-4758-d3c6-08de239a4a06
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7821
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX8gu9PTMTtU3F
 FbjfdOM2W/w2gsZq1S0sVsTlBlTYITHAaq8zQlE4JHLjxMr/HV6muNpf4WztrTqBdsduSvsXJw4
 gxIKyZ3IzzQlW8+odboVrkRQ1ybIgiNjrcvbEd366XkY1F6YIlsebKXbLMISDEnfYZ6AOSp7/wZ
 uuZ0cG6IINqv8bJcYhQ+sThHRUhhIGmtn5wOrRlssgzjRo5wn/Hcv1GyF+FKaXvTrjSQN4MJ4nl
 W8vOG1U4x/m31ORiULWSPWQ25qnQD0lyBqUHijdHeUcNkNNjRBUmJwcZTRITmSkMAA77MTRbGpR
 +3ZI9qhVvJK7kSmyG8RFus/8MowYLnc62cmyX4BrLIUXd4ej+FL3hTh8IP/DL1m8twrdaX/B6wm
 j58f/Lccl3ZJga3ITePifxea0jLblQ==
X-Authority-Analysis: v=2.4 cv=ZOraWH7b c=1 sm=1 tr=0 ts=691757c1 cx=c_pps
 a=USthxGBMnoyjuKxaiL7kkA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: T8wzQWfp1y7p38tUmVzqvf8AYNdofVoI
X-Proofpoint-GUID: T8wzQWfp1y7p38tUmVzqvf8AYNdofVoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 11/23] configs: stm32mp13: Enable LED_BOOT for
	stm32mp13_defconfig
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

Enable LED_BOOT to use led_boot_on/off() API in board file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3283e910219..7367525dda0 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -72,6 +72,7 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
