Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0200B52969
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 09:00:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F634C3F92E;
	Thu, 11 Sep 2025 07:00:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19662C3089E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 07:00:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6x7so002312;
 Thu, 11 Sep 2025 08:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wVBOGLx0ddkxdrsw3cddlKAtDErCHYDd+/IybSwga2s=; b=xDOf4HnAB8EQtEGr
 OlRGmN14YjXpl/X9CLv8c7IRVq06fopK6p7FN4SZSqWeeqC7gT1qCZMPzTfqiybD
 sezKZoChR13IdzSQpBFmxKiyek2QlVUB1Ljlnb0GL8rio1VOfRApgweSDxfXkzsJ
 jkewRoG2AeNgdVqGys0wM2vjqDunxoxryDtoX9nI83TXRzo9hkUgfbhO6PIEDPZ6
 DvLkyWmdiGTJXIaX8iziA9Bo1+PaAGxwcO+boA9PrIHrFo3gQoK2K+r6ZOC3mbos
 N/AKGzV5X23mct2x6RFZ4ToiUHGnGk+UsGKHW6Wdrl7lj2gQuL85Eph0hF1Af+SC
 D3gqpQ==
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013041.outbound.protection.outlook.com
 [52.101.83.41])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a38bmvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:59:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwMD0xBtXlvxDpSe/qux4u3GZrAKIZ74v1lvPLNV3RzBYQ9iYWjjgQcNNzDAcGXd+fgfvtErW7M1NOdXhmMPb7dy9e2ZcDAsTFBKeqYrZtq+VpJ5Es4IxqjMSxSrj5uc+DrMLOW+amlxOwynKTlPGcXds9TytPEtHoo2AKiFKjaeAGxTK7Voim0N3Yo0Eq7bPKsczJcpTWxow+vJ2TjfUGtifR+6PRuFpeuOnf/l2hJtoa5p0SnvNuBS2U5wETK4ppQkX5vUsYPcGrZAddjegprYZjLlCy0lcy7xGh6iS02M/tHR1hIktNdffMuAyZi++V8qx+w2bgQyjXL+CtwX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVBOGLx0ddkxdrsw3cddlKAtDErCHYDd+/IybSwga2s=;
 b=c5NX+E5+gaZjgZHKNS0uX2PDoCH03FMAI6DfA6nyLiOLUDM2/J3GyqgMRfv0eOHO0WPqH2mMOku9lva7aeQC9OR/HdQDTHr9LZbPbXa9KLntrvCtN2FNbm/nWwRsYNbvcO3eeKtfpROiZfSOAax+VIxg7JivmyECyv25+trtTBNqx1n1KQE/WXtb7dPdct1ZWT1UrZjv6f/ALi5lCmvXLdiUZw9KEvPsp2DQL0KM4Ot9WFeNIP4aljiulb3cJrKgWZxXp+Uzo/Wp19cfXOlJfOcttyO4yvFRWLoP1R5BcZONhl+/tJ7aO0lcL6Iedn560A2bSD03ZAbVDDUoGAA2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVBOGLx0ddkxdrsw3cddlKAtDErCHYDd+/IybSwga2s=;
 b=oB+yA2N0hff92w9Eh6LfTPLgeOpoEe6mXfqTFWX366onMoViotSugEO3b6js1Rtt2HJvW/BUwqL4TgnchlL3bJTS+zsUyTW1/lqUwkkpOzHtyLCUuZ0pSIYu5ESAHgJzmhvsRS3Y1ulg4yjRw25vs5fqgsnB6T5x33AgXBFeLMs=
Received: from AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33)
 by PAVPR10MB7465.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:59:56 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::3c) by AM0P190CA0023.outlook.office365.com
 (2603:10a6:208:190::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 06:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:59:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:57:34 +0200
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:59:55 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Sep 2025 08:59:43 +0200
Message-ID: <20250911065944.15020-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250911065944.15020-1-patrice.chotard@foss.st.com>
References: <20250911065944.15020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PAVPR10MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfe46e0-19fa-45c4-3468-08ddf100d0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSaphd0a5qfd+OIZBw1cr8QvMRkf9HXnxBpO1VoBB50BoUDM3qtoID5yp+XK?=
 =?us-ascii?Q?AB3rJ62RNH/IFpsYqOqebC4txR0VUV6WaTIjW9/3SuF3LTSI7MLi4vIGfSj9?=
 =?us-ascii?Q?0NxXSBgV2iwlAUOlcUnvR89G5mAT5A+VhRl6+fwQ/D9NeYkztORRrNX1XTll?=
 =?us-ascii?Q?TT4rd9YaaZoQmP4m+ZXg8+v/oZXhzc+s//8zPNYcHvvgJg3lHGvWZFIkK9IE?=
 =?us-ascii?Q?L79Bvncf3iZ/LvIpzZWqW8MgQzfxe4YZzIbZLT1WkGCf46fQ6hNvnXJZ2LHk?=
 =?us-ascii?Q?It3zwfNJijAfQnvNgOg2bvmKM+OFdO/P8M+YZb7qsA78m5UsUsKfSHqbeEVK?=
 =?us-ascii?Q?AKisna85FV00MFDLyzo2EpmPZF7zYI1RJoiobaeZIda9Z+n09Fy1g9N9z6jI?=
 =?us-ascii?Q?xlKHidXIFrxA3/V/3qn8nWApLWKSLkWX714rHIo9ECw9McYuXGe8FFHl/dI/?=
 =?us-ascii?Q?Yx8/KtG2TTV1Ln00uaCGnpC+RPj20i6fJ0XKbH4v5orcYF7FkxUkeQEfOchn?=
 =?us-ascii?Q?pZx6pEb64QbhZiobouBhEG56TYOSrJ4xfrI8zJvVaVaTc7MRzz/mP7WPg3n9?=
 =?us-ascii?Q?VKMD4/gQO/SoEGoj5ElSeXBv7pMTE51NumEcdD6KfRyFF1XQkTLu4BfZ1dYT?=
 =?us-ascii?Q?uMStcrZCVszh818PneET6e5ppyOdeW2Y7hn0Dw2qbUNhexAo69RVXqVFIEbL?=
 =?us-ascii?Q?B6vH3TfDgXUcdEdZAMra3dWtbu/dyavVdJ4vS1Egz+5kKBuXogPzWEkvn4pX?=
 =?us-ascii?Q?qm59XJD1ukMKWAzwLPF/Rc2BYLdBErzJ59ZvsjLcOLh97OF3qJN4MKDQKxk4?=
 =?us-ascii?Q?WiN4AddSLsNv0iuLJKPFhm9Onh+3N7eKTu2lHFv0lvimn2/osQw3q7t2RP1i?=
 =?us-ascii?Q?5YcUUTNGOuqdLRF/w21PjuQMnr0g0BYLvi2uzWA1NjzKtX9pT1KoCbkEcsLI?=
 =?us-ascii?Q?s0AjJ5DpDLBx/53kcUUL4WmFh1DGrG9i/6xxlvErQ0V4VxDFjHX0/FOZMlSs?=
 =?us-ascii?Q?3WI6LkrnbNg89apfrsfBMlPCMIP02UWs2PyNHWWz5f9uIt2tgrCFoaVzDae0?=
 =?us-ascii?Q?t249gjMOCEik9RvKcDGuUKLWJMJaFzJfE19WS5rS+fM83RhG2noAJnYVEp78?=
 =?us-ascii?Q?AbZZrwLSzH6s9ty+2Eyyw80kEW3PGVrFaDCDXLT2ZmGN1y/ablw/4LpyIH1X?=
 =?us-ascii?Q?Vhj9Z+VDuMrFb3kSbwLv9MK8GPLvHzJ+QlTBRGb77OUDobUC+wl+nh2b3vaf?=
 =?us-ascii?Q?wCKCbhVvwk+AIYXZP4XPod1FnHDde1uflBjtsvPKfX3/JT2ZMOyDIs4gyYDT?=
 =?us-ascii?Q?kjv9V7euOEmF1gKSbhZBs3Pza0KAT8J2N0JDULFFnSmYIMWbn6A58zlMD75c?=
 =?us-ascii?Q?PoV41I+8rqqCSLnn47Kt9laZ1FQ45Q/eKQkJQRMbJk0RWkOcdWsBgXqFztkE?=
 =?us-ascii?Q?PpThL4WkN7b25GDVzJRAQqlrYfAosVTbn+nKKGjwXEbpRbjPceA4BjDHDKcf?=
 =?us-ascii?Q?+fBw21ThcpqEHsLuwOQue3cxItIScoT33/al?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:59:56.1817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfe46e0-19fa-45c4-3468-08ddf100d0da
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7465
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfX0T7kcsoSHFzp
 PDKlakYtoSA6Kh99cXd8rtK4LRlZ9H+7dsQmFpUWEbUb77cD5m3k9mWF0IJdSZsA8UD8Ieq1uAy
 ZMtIlDlPt3RFvMT8fkDSnFB9xGgG9b6DDLPVbfEQ8w83JylEkmQ5c9LDtHeW17tyAM8d1Nw6yJy
 /9RgcqIwiO2/O6B+AZ/jKNIVxq2PQOwXQPLTPoYOpvid+/WUgKwlDuLGiVg1qcp8EbKmfD7ckHr
 mZ/6AoMPGBdrjyGR3SJRQTKMWA2WnJcl1XEgkTdFdoAaPikGkPLmyf5dXQsRfoP/oKLemVFsVoF
 y+0cIOSvogdk0R3jW2pR73JXuI77b+UfrQHhF4OW24ZmA0F7LRO05Klzi6WdKiQ8WxMB7ql6uHz
 ihEO/Dp4
X-Proofpoint-GUID: 9_ftLJ9SztwtjpS8OiqInSNtqE35tvJ6
X-Proofpoint-ORIG-GUID: 9_ftLJ9SztwtjpS8OiqInSNtqE35tvJ6
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68c2736e cx=c_pps
 a=NU0qqxjM+jlkttB6xbZzfg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=Raya_AjGJ5AflnsAD0AA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 4/5] configs: stm32mp25: Enable configs
	flags related to SPI flashes.
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

Enable configs flags related to SPI flashes.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 configs/stm32mp25_defconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 14619ffd96c..c8d8f14f843 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -33,6 +33,7 @@ CONFIG_CMD_GPIO=y
 CONFIG_CMD_PWM=y
 # CONFIG_CMD_LOADB is not set
 CONFIG_CMD_MMC=y
+CONFIG_CMD_MTD=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_RNG=y
@@ -59,11 +60,22 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
+CONFIG_STM32_OMM=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
 CONFIG_MTD=y
+CONFIG_DM_MTD=y
 CONFIG_USE_SYS_MAX_FLASH_BANKS=y
-CONFIG_SPI_FLASH=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH_SFDP_SUPPORT=y
+CONFIG_SPI_FLASH_SOFT_RESET=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
 CONFIG_PINCONF=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
@@ -75,6 +87,7 @@ CONFIG_DM_RNG=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
+CONFIG_STM32_OSPI=y
 # CONFIG_OPTEE_TA_AVB is not set
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
