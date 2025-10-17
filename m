Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C7BE93BF
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:38:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5F0EC5978F;
	Fri, 17 Oct 2025 14:38:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 523DDC55586
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:38:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCpJse024084;
 Fri, 17 Oct 2025 16:38:16 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfavpf4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:38:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjgyB5pt0o6mf/Z9/uH2FNnicHVVSZbhZmYseVZ5wD9pWODOWiz9RK33EQuLY7zbwWEBo4XxK4tKrhURRmbz6Bju05/Sjmvm/qv5aYENkilMY6LGVVBOep4KOsy+m+x80zecj64z1Rnmbu5+qCDTfi93eWW19EWT//nODGQatNmxtkqWPZLo1NU77SQTHjsX7p5RHDbb2oWOAzYpIlA8I4L3Ge7Kgv3yV716ZBV++tZUR/uKTOrUvkJ79idmL7RrfgDcP7cOfyB+rFppwpiYGRsKvbmFEn2rxTq04RvI3FiyOMG2yu3sYCo/aqvHueGgb3B9eObvNe4BI5N2ogeGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fvrLqV6Gwq6WOmC3qKhuCaOY//lOeU/eG+5W26XKaM=;
 b=GOb4I0jHL1kq2Q6MJjMkT94M17V8FKYtYiUQUsH4Xh6HwZvuA39YaINojGtK65IKvorRB4FqxyNWPPXdbnDN07ejvK9SpBthVnO8bNxH5edW5k+2nrBwCI0C6m99Af/B7mn+aTvlHIaKmvsN4Nuq3QbSrApNWrTd1VQGOG6norYyVeTBfuhzQ7PqatULY1em7+26aVP132p2erhdi6OyX1OjzeFF45V44aHgzoftZZlGM1DxxY2ykxo8q9yWfvZDp8f1+91g7RQ90Fm2fHgZjnw12bgfhRAVMaVc8UBtBJc3lnR8qInXOOD8rb7s99HvhYIVBUdirrzsuuHTQ1Z+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fvrLqV6Gwq6WOmC3qKhuCaOY//lOeU/eG+5W26XKaM=;
 b=VE4xTqVEkJApwV1AWXX5wog1YqVye7BA2OGaxHkUu79WPypEO9/t31RopcyGbND3KRvxGvbedBW5Fi28WwuSxllu8zz0FSL93SbxWXXN47x9OqjTaF2LuseefPO3x1CJ4K+LdEE7+wJZeByTB6wuWu+oB8wnYNFBRJtXh/fbFor84q6C/EYdrjbl3JXiN2ZSA1yaVY6zg+cVT+vaTon1MdWTKBtBguqI0/yOdJxslsOvIFO71n+PyR/aGsi6tEOisI5qulAJw7OvtF8yMk9iYW3dgxtEEGKQXMAJAbud9hCJhB4HLwitB5/UGsW85If6+j/IhWQTTsrSnNMHObBTKw==
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by AS8PR10MB7136.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:61c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 14:38:12 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::96) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:38:11 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:41:14 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:00 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 16:37:45 +0200
Message-ID: <20251017143757.202571-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|AS8PR10MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 42aea11c-0732-444b-8901-08de0d8acc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KII9CpuStgu+C+VF1jr2PCS2hOY9kkojLJT8ANj4E7VDwPBZhVsD9ozGQoq+?=
 =?us-ascii?Q?010Zmy81Z/NKanu0dRGL2dvn18YziAx514r3933U1o6uXltLWcO/zZTSDlCX?=
 =?us-ascii?Q?jHIwsZu+rsAsZiChStIA/PKvkj+FhELB49kGFqiFt8rcED+x+3S3DDNzHlp6?=
 =?us-ascii?Q?gugXfzcwS4KvYih9yRdQw6fY7+QvXLvp/dmkbgZsmXZ/BQa0f7R3dnbfGl6j?=
 =?us-ascii?Q?q1wbpgGbZFT7ffwzaEqHTmm+dMtSBMDbOdlIpeVPkyT8imT0Yvd3DlZwC6YK?=
 =?us-ascii?Q?v0OsxTnhiPM/29s7ovl7sJW6Ps3ug5n4fyNTv/O1c9ZXqt2FkGFoWNkeehem?=
 =?us-ascii?Q?HSJk8me3K13ZMi/WTEytYLVYs8dAM0JcXqyKaAJtmQVTKPHGOGpq2miAyOd8?=
 =?us-ascii?Q?UZ4k4GYlZDQijPjWrjtvl21TQUOlKwgSzpw3iXDCa+zp56oA7PmJapKmw4zP?=
 =?us-ascii?Q?aM0iWuF5jVHC0lg4Ax3HG6DsOlL2QLbS+8lfJBJaHhDzLogkjTFqujX0nHD6?=
 =?us-ascii?Q?wbWsNuXuRFhlUYGWzZYPribsDvrP2DvGWbBdvwRno35YYGHD2I20juVRI89R?=
 =?us-ascii?Q?y2rMwIRbux7PokuwyHRiwsVjWQyyIB9ug/RQMu6sXrZ56DQOZmSZMAc8MXe6?=
 =?us-ascii?Q?rO/FQrOth9vyiNPHGDYoJ7fDdW/fTlN6sE2v/CkUaFVzbMNu+UlzmbwCVPdF?=
 =?us-ascii?Q?3PurPCFyVi1WXtvWMZS5aB6ZewICwQDc1JG86pCEZAc+XQoflqU9bnqBFEhy?=
 =?us-ascii?Q?aYclh8vg5KdfGKpLhFu+pe84lcsVf2hOrUeSAinQFE23+1CLIBfemvQ9ajSZ?=
 =?us-ascii?Q?rwSLG+AkpS5ItOiZRLGBcS/FG6zxeHfljKcX7Sebdm7gyACIhfaGJbyogtwZ?=
 =?us-ascii?Q?ewK1hOkv20af+/YQV4Z8Hb9d76ePxMRrPKT4dVAGpM7A8JEMwrrTdzM9Lqbq?=
 =?us-ascii?Q?Uh7rkJ7X5+CPrNFgMJmaMLC7hAzOVYIXjN9Fv94LKj8cx24lxSfzs/QFSivX?=
 =?us-ascii?Q?kRp13Q+nOMYDzTiW0xYfKXYRmlnpfce7mVaadMEjznNHgfvOtUvQx8yaSnpN?=
 =?us-ascii?Q?Z+glH7I7M+j/D+6mtewmw+EU4+Wqx+JVOsE9M30xacTh0FdDVYr0b78yjIkO?=
 =?us-ascii?Q?BzZ/AX3M0hBSV5yHWBevUryn9HwvkC+UAD1b64xfYM79wqDjpeIOopQfib39?=
 =?us-ascii?Q?GqEXo45R/Lx0do2qf7t5F/Ie26dg3wWzfsEU3QiXiWBq4BPnTKynrAdRqJqe?=
 =?us-ascii?Q?eydhVpIuxM1tWICtx/gd8WGRsALuKI4JBXonimBWYGSdKvIxLSHN9HKos77j?=
 =?us-ascii?Q?ib24mYyUTMK6sTilTEorvxxPj+79GswevwYEZP80Yn9XgBzw7EzCxXx6QN/R?=
 =?us-ascii?Q?D6AGgS4b7v/ii09tZD5siO9ceWEhviemYonES7kZ/z6xwy8UTq5CeTG0fq4v?=
 =?us-ascii?Q?kv+ovctp1lIPeQR9DpPJQLZDEVeyeoy05iw3AYLmi2tgtSKGWvzMTCWd5Twk?=
 =?us-ascii?Q?0f+5WDnenRwztheWl8DlmLX3Wg4cnuIT1/A8dzht3EomPtS3eBo9iPlVZ+sw?=
 =?us-ascii?Q?+6ermHP1RmI+NeUYL6A=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:38:11.3670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42aea11c-0732-444b-8901-08de0d8acc24
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX+k5k4a7PqADe
 mkpUfu0gexqiyfG0vOajA+1/eO/uMJXlq7BDTqejdgxWm/ViHqtdAflXAWnrIl4C3I+YX6o1F3Z
 SorNn7b7ofdjcfeb/Zm8u4pFC1FSdty792Lc0B3CiHiBCW235rvBdnvawJJJoMaSfTZPbQ87kPk
 1b15miZn8CV+CS2U3n8atcvgqd3Dhf3tD58bHU2y5M5jOp5OwT8n5l5uu27YbazlPUUQb/kFEb0
 l+CVMBHXsihH/ZS3NZE4uoZMFj1Xni1U8L+jMkVH2hOPMxIosU9F+C93oMxtxFkZalXmZ5rxyb3
 hr1afampx6tiEIcpEJWT+0q1lT6/V3SDzegJdG3mWqPpAN8XOa4nH9dE4XbuioGeFNKIlII2ml4
 j1HLj5YmGxvTC5+WuV8Y3fwPros8xA==
X-Authority-Analysis: v=2.4 cv=Ne7rFmD4 c=1 sm=1 tr=0 ts=68f254d8 cx=c_pps
 a=/rRiG8GCWFf73VG6a0KYlw==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8 a=eFOqJ9MERmbbS8AOseMA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: Wer49XKPIJC1V5tdC2ezoI-nzcQ8_igj
X-Proofpoint-GUID: Wer49XKPIJC1V5tdC2ezoI-nzcQ8_igj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/5] ARM: dts: Remove u-boot,
	boot-led from stm32mp257f-ev1-u-boot
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

Since commit 69542d06920b ("led: update LED boot/activity to new
property implementation"), "u-boot,led-boot" property is no more
supported, remove it.

It will be replace by /options/u-boot to configure LED device as
described here [1]. /options/u-boot will be added directly in kernel
device tree.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

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
