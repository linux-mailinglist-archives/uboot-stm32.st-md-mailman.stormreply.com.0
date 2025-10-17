Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FBBE93C8
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:38:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E05F6C597B1;
	Fri, 17 Oct 2025 14:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E66BFC5978F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:38:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HDc1BT012156;
 Fri, 17 Oct 2025 16:38:16 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe6qcga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:38:15 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYfFKBT5v8Xo1wHS2UcOwZdQkS6quzTNn5mLWqXBFlljqloRuSdWy/dIFXP2X23LYSuHNmBKW1aIe0jedXFMkvB9m9s9T9VEdQts/BbnmnAl/JeH3rtQEmQeNXuUI9tmr4XuR8t06aHu0XiLQajkjhCzPfVkwtd9P2/ue7Wg8bBPx54WIGkdGisXFNMgYGb0viMEuW0Xx8fk6BsYMr6QPZchklzqs8om17VaD5K2/QafT9YjKErBS2lQXm+wnwAxyVavlKesYqBDo4G74oTxtu0BsDXzu6EXIhKJHnS303Tty7ElUPE2wFHwnrNbwz5k8lRa/xmHGcn7bBfn6qcm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ogdynMMjxJE8ru9SoJa1eQVGaLm9kozMpUCvVVJw70=;
 b=sYQuO8JGTsMM7yvjudXl5JeT5jBnfVSDpaxTQj4XO9gbmTlJW6twrhxp3MwvzMZFaMCPFnEXB74ejFNrzWF6Rhq1Of1touclHutNI25ppU1aRIwmkLVgRuQWV0ePNFTMbl7jR2eAs0vukz9u7Epx6oHnlvIRjpG1J73tFAOJ0V6p8DdmSU/Kt0U9p0/hcTixQHT7iuRuvRWzr7z4Bxu+xSvAqyXFFzykoxWCAc+6gZd4R+mpL0IPygaHYu59me/RUk8qu1IwT7bfkhKV4HBtpTCboRWCbeSLit3Il3KL4nU1neWfI3++BIAkVY7TkPyhhQ/4OrFeKmQCEj9VIf1aZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ogdynMMjxJE8ru9SoJa1eQVGaLm9kozMpUCvVVJw70=;
 b=PmHuAGidnyMIwvDY/fuLBk4bVHL+Ch6Fz3K+gTmaOBMw210KX04SKcSVfaixAhIuY3JXSZeAZULlOU+ymmsPhp5xuTeyL6WyAjNVepWdhS8P1HTbDfCbv+R4vTuCIHFvmwUjM9f8QGhmDO+FfekNqW16QYBDubd39sWnMQtOFwCof3t6dSqccB1p4Lvy5VpV/wl5SC17iueOVVjxCrUkGlaysVhJG2bYW+Eku+ODvGg+ey4G943Ot9drPoDIvaR/gFZIuGbiSoUQk9H/TTnhGRCLU+OgzSrcPpC3JNO2wy8C8vMquvRuD10zjvdL9lToERyFbC8mzXTVVbIkc3X4nA==
Received: from DUZPR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::20) by PAVPR10MB6839.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:323::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:38:13 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::56) by DUZPR01CA0050.outlook.office365.com
 (2603:10a6:10:469::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:38:12 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:41:18 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 16:37:49 +0200
Message-ID: <20251017143757.202571-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|PAVPR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: c9972277-3163-4a02-e063-08de0d8accff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/8LldwVbG4fvXxLh5kfP/yRlveKI8t1Y/c2JXbpNv6VCdLrdiMwoBB1tSIYk?=
 =?us-ascii?Q?BZ+PurlpGzVVyaq3v4dMb3S6Dwhu97QFzmlseUQVKyUjvuyjvSc5NQGhUBOL?=
 =?us-ascii?Q?8eTL2J+2SzRQFVmLECx9StdfXiqR28A7IW9ZyjA5Xe5Lg/PaOJrMCoQMfcGN?=
 =?us-ascii?Q?zC/AoPm9M87BhOVTSNlRMDe3gyajNN8oKxTmZPU1ZKJA82OKP9rcOaLDSQzw?=
 =?us-ascii?Q?8HrQ2oEKOT6a2FVMmPSjel/cti80jiBKWgqeOAQR1IDMDCHgNz2FSo1xcKwP?=
 =?us-ascii?Q?RcQC7KFVG6Hms4UL0rCVZb5c/fBB6r1Bo/93IBgZBcV4NOpYgGQx17l96YX3?=
 =?us-ascii?Q?Zdh3cLaMpsuypHwRK0A/HxCHqbOfo/WEOtMDBTZEoAau+vBvb4JL1S3qkF3g?=
 =?us-ascii?Q?fQx++jsp+cJ4QVN69JbfTq3A46MMofmA+cXwF1u2qsubEbqT7i6RMsoDNbkC?=
 =?us-ascii?Q?0A6O5vqquxHHxtWaQjrEsx/iDrJxXH261LdSbsRcyQZwGctfdjuXGDp6vsne?=
 =?us-ascii?Q?gcDET1+6gNxhlvStcPq3Twkwz+Qy+i2DE1rUmyJ4dQJAGpmXEq+UuHnFJ7g3?=
 =?us-ascii?Q?S8lChKlbf/uKF0Y7zmj3GXlJMhQaexBP9axJrE2+ROfu4D3EHfsxKLwjWyp3?=
 =?us-ascii?Q?HNQJLZAdY5iNAQyz3FyJgxJuzfhw/z6ZNxZV5LURyPedhkxHSuggosjgadIl?=
 =?us-ascii?Q?T/nTHfTObcp4LbBdZPCcIcM3fJFkRl3DxUxsNn31HlTRMXzbNiaKKZzMOwhs?=
 =?us-ascii?Q?K/cn+ATgmkeQ/3SGMR4XXZa1KOiSUaSsZo4O62t3Qgn5NOAjYQ4rzz70jSKF?=
 =?us-ascii?Q?GBFEPnyNcNP21+ONpH4S1h51UpMbnfp0AWVtUN0XjCHXOT6KBXTeRIgm1N9y?=
 =?us-ascii?Q?/uyb+S8gektu7oY2WVkI4IYB2NhmU1aS8wfbqdTlYAk/NyMD/LRHxIeNaPQz?=
 =?us-ascii?Q?z+0Y8uVVn5ODnZWXOBnxJYCeKi1nGAyTBt4sEXOZDS6fzF4Ti4sQeZ/iobA+?=
 =?us-ascii?Q?9dsyGWE05haIq6+oXLjGYzvmXMQ+rjJejq/7ErswhlgE3upiil7w3UA6wE9Q?=
 =?us-ascii?Q?EK2A6uKJR+lZw8YkqeQz9nNUKd4af6y+cdhLM6H55paHSm9ZeUV1JFBUHpwz?=
 =?us-ascii?Q?5P7bkyeP2gsyv7JJGOjGpVG3j0vgt/dTup0zetDdEVEriNmmwLJOYDHQpP2f?=
 =?us-ascii?Q?15dVftPpRg8mv8MQzooFYH4OJ6OqgQoXBRSgQeEM++B/yDOZ6Vdil63n+c7g?=
 =?us-ascii?Q?1zUr+YYPmltdpwU2cAsFX4TomZFMoKZXM+e3jCD6WH63kvSwD64yLhc3FNgW?=
 =?us-ascii?Q?C/SipLkQR/GmqK6pKIzXgNGWJfJcyk5Lh69FHd2sc6R6GlVSlfhJW6hCWOSn?=
 =?us-ascii?Q?maDrD99yNGqDjQfkyCu4GR0k6Hz6YVv0RGCpgd7z2vmc9tqMmrMFvfV3Pwoy?=
 =?us-ascii?Q?xwkFQ/ridmqzBb4GT3vlTG1Qi7vkVL4fOIh5shNJma17c4RI69ghUgGe8P6Q?=
 =?us-ascii?Q?DgTj2k7Iv7R3FjOn7xOz4raTcV/qv+HPUFOjDJ/PVWmq2DhmFgtMJNmrWQVg?=
 =?us-ascii?Q?bHgUXU5sSvDIsAZjomA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:38:12.8133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9972277-3163-4a02-e063-08de0d8accff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6839
X-Proofpoint-GUID: KOMKpMGxYxKzcR3bSc176x-LtjrPbcNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwgm3jJrnlIE2
 R5oHJCTjLSn/gA9tnA9nWrWJHgXIMyNNxvwwN7ZxmozBPmB2oXOSIgYs/TYwyS5JH4Omo+y6ivB
 NzLwtticBuhhO3z13u20scIIqkRwqFSApgVkQ7PZq16SL2/Muc2a6renz8hlAluUkoK/zEb15cb
 K33X6w8p0tfT/Wbrw3T9JmnHIMto4Szu06cIyrVkJLJ44A5EusL9kAls3R1AQZq/fUZ3iHVkPhm
 HZ+4S1JRDVQ7CmlqZ+31rXzxgYb4vwaarvptu7XWhLoMlyvrgUC7nJl0txe3w0uFTVBrmLuq0bx
 urvWMbO4TTKV/ofp8utXtR45T5G0FnmqbZrVUhqIVqmdGZORcUVGFhEaewr9UGZe05mTOFkfRYT
 x1W/dYRj+BNzpLR/INEVWAGqlaisoA==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68f254d8 cx=c_pps
 a=9v4tHtsx3FkFFVH89g/dOA==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: KOMKpMGxYxKzcR3bSc176x-LtjrPbcNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 5/5] configs: stm32mp2: Enable LED_BOOT for
	stm32mp23_defconfig
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

 configs/stm32mp23_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
index 840855c23e5..49f47becba6 100644
--- a/configs/stm32mp23_defconfig
+++ b/configs/stm32mp23_defconfig
@@ -55,6 +55,7 @@ CONFIG_GPIO_HOG=y
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
