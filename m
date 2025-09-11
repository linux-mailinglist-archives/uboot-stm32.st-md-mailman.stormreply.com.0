Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40FB5296B
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 09:00:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A02A2C3FAD0;
	Thu, 11 Sep 2025 07:00:38 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1FD5C3F92E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 07:00:37 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6sqeD031882;
 Thu, 11 Sep 2025 08:59:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 divFWGOy4au6RKCbGyMC8QpNMCnkwMI7AsAf370y1Jc=; b=TZE4cxI6+ZrhUN2e
 vgcsUI8Y1hw5ocM5j830+vGGUfTznz7dVR+dP3sLfaiyxA5/t1IAnuXlMXDaAI8z
 atHqkJ4PiIoRshdOvWicFvUMNT+v7qRClrGb5XcYvOrQcK1WVfgIfgfi1XwefoG8
 Y14i8G99j8h1I/V78QRBoZY0rgdjOX2tOMK0+3ALInz2jN/RuOvwtV+56OliG3AQ
 ajSefNFW2TYWlDVXnBscbkGNSHmqGf5e3p0ZtCvp/2EfGA5GhGJXRUEms7AIoktn
 PGIw4TXu3xVbiFaJB6VUWhbRgzCvqgPqCeKhc8/WT/hDCawDLQC+V5WaOtIR3MWc
 nLU0UA==
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011062.outbound.protection.outlook.com
 [40.107.130.62])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywms7th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:59:56 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1K99TUkcXqgdruuA5VaCNbovRmb67h+LW/rVq1PXX3LnrnUYV1YdMcQehcwffM506wNANqKE98j6zkKQ86FJnnzkbvKRRlA0kYFDvGUhbceSTbYlJ5K65LvXkLTKepNaucGA5eDEh4zLa7of8iEhw5AI9DT5okWMX4FfxbSnzhAhm5XxqNyj9sBpyGGCW2jS1+Vh3kVOsG2ciqqlvTAZnc7QmjeSAEuCWpdMgHKWHgXs8ZlxRgY11RCblaKPTrHxKgywVMbSs4H+vRt1WNRbwQfdecycR1d9BLIStj3azO2oCUhcjS6vqYA8SApbGiQ9nm/5tGDKkcMivmYgjNUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=divFWGOy4au6RKCbGyMC8QpNMCnkwMI7AsAf370y1Jc=;
 b=IqUHdn0Zx62DPXn86857QxWTBwRojjbLgUuRsQwIpErGrLM3wr1aach1GJIKXSNeNJwPvqHonNRJCKevAXp5AZCtp/S4IR6HrCzejviI8Vr5YcsjrOMZ0/5j4OsHxNmSZxZVuHA2aJKMZ1t2hzv0PCGnAKOpKtBiTylWCaTx4LCIA/1OgS0jZPYwLWa3iv8Rsc9SuasLfyZRjLbkqT/yNy/9XrPiho9QN4RiLbwX5c8uGikDLEQt87gh1IEvYB11X7uABZa72ERgOw9u38IfqbtOjMHgUCyn7H5r+/UhmdZxco/tGBdhcNaIAOAx9dFBcAvOnng1hFZu8tpkY9z1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=divFWGOy4au6RKCbGyMC8QpNMCnkwMI7AsAf370y1Jc=;
 b=Cih54ZVrnNSkJ1g1BepHdRHJohh98cYZQTbAAq9yzjPvAOvhYqpxLe0yHaxJOEt/QHL2KGYv0NoHMsxTulDqwkNKEZPOTKd4HVe8mN/mEyDVX0jNSfGwdtgQDJFTX4f6cELBM2YVk/2AElUKibcbexdux0BHM+mOqJwKSpkZczU=
Received: from AM8P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::25)
 by AS4PR10MB5393.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:59:54 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::e3) by AM8P191CA0020.outlook.office365.com
 (2603:10a6:20b:21a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 06:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:59:54 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:57:32 +0200
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:59:53 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Sep 2025 08:59:41 +0200
Message-ID: <20250911065944.15020-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250911065944.15020-1-patrice.chotard@foss.st.com>
References: <20250911065944.15020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|AS4PR10MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9da9b8-e253-4d7b-5cab-08ddf100cf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QxIFVXyAgqZv9pw3QCHvD1F+Uhw0xFUK3H5D8FcRB32oinJ+ZXfb+B38Jl5s?=
 =?us-ascii?Q?i+Ex1/TR+nnqfy1XyL7++BaKsN0rvs9gLKEkpvL1BW5RhFpt5bZ4ZBVQKb4i?=
 =?us-ascii?Q?6CwTZdRvn9NHMGTxaM0/kT70Jxqzvjo7QFZx85aAo5aZwhLGBHiMOBZXC5y+?=
 =?us-ascii?Q?90worpOWwR2OWRKQ+IOogFlgKKtUAMC5Y3Fc2V7WQG5lEi7oov0LSnxzzcvv?=
 =?us-ascii?Q?bVkXXtTWW8i373VuSPyXRH+TQTUGMu+juQfNGP2BIUPfprR4PZIKUQKf/bjw?=
 =?us-ascii?Q?r43bYy/TbkomYCyVCchNZb/0f412rVysHJ0oh6AZaLuDQCZa/uFNwsEr5ljt?=
 =?us-ascii?Q?rbRL9eI6cc6zkuGZNd7lgE5/GlQ8PtExCbeJPyvjSzsdAM20/1awYrIlpMrw?=
 =?us-ascii?Q?5uvDYLauJSKzh8p08HIoSlZ7wsRL4y6MdyhvxBA35SX5o4r4E27QR7A6lPOJ?=
 =?us-ascii?Q?HSLbpP9zw3notb/rk3isAz2eRNm+sSc5sMLwD+VSzrFE7vR/SD1FTNuPK51+?=
 =?us-ascii?Q?kQF/00NGr6YtJzZAAGshEMR58oYnBpOu7siDhgfScO0Ar8885lH72/PDQj5F?=
 =?us-ascii?Q?u8itZumG9oYn/U50wSorT76qUJAJYIz6k5/T6FaM1TGsWPoYoF+7GytUUvwu?=
 =?us-ascii?Q?Xvy3r1XhMRYlm4rECQ7Z/MDcilYSBISPpFkvI5O2KuZjbyOJSQ0tMS1nOp0g?=
 =?us-ascii?Q?huxFJ5v/x0mMsVwuza6NqQ5r5CnYRSAqh5TTvqd42QESO6mqzgtbXwSbazyL?=
 =?us-ascii?Q?e1Q5O4ydJ9o1QRFzm3iBfXgXgWk8aqP97HkmbLGTZaLbTCec2LOzZ7sgJdOM?=
 =?us-ascii?Q?q/sg9zVmpOj/1eQ4gNtL8+lolYXVUDgyzQhcYXGn3g0X/hKapyWH+GXLXrBI?=
 =?us-ascii?Q?mCoFNai9YbnOOvyGlZACNfuCTHkbDWoNNBopju7nuTjsOrM4hh13tBSo3jto?=
 =?us-ascii?Q?30FCLe08i+ODt4oamguyLilDEeNgaAstSRUtdELCDH6qNk46Ulzucy10++d1?=
 =?us-ascii?Q?N9RM9EWjOMHrydBinRrbKUW6Z8PntcaPoAB/OPVUqI/iMrNINw6pPiQf4efM?=
 =?us-ascii?Q?HD8bjZMSci6GVV2MoUcWmVzmKX5QnERX3ahlGbBX084wU+HnlaxneCrbLdwL?=
 =?us-ascii?Q?rVsza1fYgXcWsA0DNqRxyJR1pro78XQBlcgj0eZYC7kUrbDHR6q02Ul5d06n?=
 =?us-ascii?Q?Ty+mbhVGG4LsrrWD8ReFWsH9ZIAi9bYHrFN0hFtzTUtngONAlzL4tniqCRxj?=
 =?us-ascii?Q?jwQNzzFGuFYtddiWz0xrIduvIQ3FJPuPOkBnWDZ38ZForFspRAoxWZszDMxt?=
 =?us-ascii?Q?6pY70swy/RqXkMaIyY/aBGf1/nL0ohJgNxTMp8rfBXTkJvwoWWszBGqsshVZ?=
 =?us-ascii?Q?qOpPPBv9fK4o/G8GI66X6H+4uhuuJfXPwBpXwWjSiLufIx9ZkKu+Wyidng9Q?=
 =?us-ascii?Q?H37e7ur0/MptbXrGoZ1PYBSC0T33ebDMFkSiGal57/qcz67FWhaE/Nvjn0C0?=
 =?us-ascii?Q?J7Cmyi375zxOpVhOPJe5GjppnhG9hzGkW/hQ?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:59:54.0931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9da9b8-e253-4d7b-5cab-08ddf100cf9c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5393
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c2736c cx=c_pps
 a=p/fnoOkEHhSpgVuCFbvG3Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=uFTtUn-lN2mdwel1I5oA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: Adlq_hJQP24Xt8nmPktV977Jq_2VZtnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfX/0TNN5npMjXA
 0KmiHApKW6DAJMUkwGOAvgxzUV29q8YFokbEXwLKfHBc81DJAAjyiLWN9uu9si645qM0Ba4cYBt
 J2OZXfdU7an5LtrL80TbLw/gjIDoVD4MvUbbEPp/u4qymy7GfB1kJC33kUS1RPhFf9+pq0OIUm7
 BcjTQW8UaiP4aX2Tlfa0EEK36iMp6YhjQma89OKXZYOz1A4KyMlP/5l10/XV4hrK/RRHaCxZws7
 ZHkrpdgPKIAvlrtgr3D4WC6qLsXk1AIaZoOfGkejT8nyqOw4Wxd0a2+o0gAevpaATRQ/BJOEsNH
 nTVTgbmickCtV3PjkKEp4whI7vXlyleJ+NBP3v88B1nbqlm1UOaDNBgFtunnBKUJaaNGEWanMsC
 Of/aBQkh
X-Proofpoint-GUID: Adlq_hJQP24Xt8nmPktV977Jq_2VZtnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1011
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006
Cc: Tom Rini <trini@konsulko.com>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Jerome
 Forissier <jerome.forissier@linaro.org>, Greg Malysa <malysagreg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Stefan Roese <stefan.roese@mailbox.org>, Simon Glass <sjg@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Yao Zi <ziyao@disroot.org>, Utsav Agarwal <utsav.agarwal@analog.com>
Subject: [Uboot-stm32] [PATCH v2 2/5] memory: Add STM32 Octo Memory Manager
	driver
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

Octo Memory Manager driver (OMM) manages:
  - the muxing between 2 OSPI busses and 2 output ports.
    There are 4 possible muxing configurations:
      - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
        output is on port 2
      - OSPI1 and OSPI2 are multiplexed over the same output port 1
      - swapped mode (no multiplexing), OSPI1 output is on port 2,
        OSPI2 output is on port 1
      - OSPI1 and OSPI2 are multiplexed over the same output port 2
  - the split of the memory area shared between the 2 OSPI instances.
  - chip select selection override.
  - the time between 2 transactions in multiplexed mode.
  - check firewall access.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

Changes in v2:
  - Add stm32-omm.c in MAINTAINERS file

 MAINTAINERS                |   1 +
 drivers/memory/Kconfig     |  17 ++
 drivers/memory/Makefile    |   1 +
 drivers/memory/stm32_omm.c | 421 +++++++++++++++++++++++++++++++++++++
 4 files changed, 440 insertions(+)
 create mode 100644 drivers/memory/stm32_omm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3fb163aa1db..78bce87a6ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -709,6 +709,7 @@ F:	drivers/gpio/stm32_gpio.c
 F:	drivers/hwspinlock/stm32_hwspinlock.c
 F:	drivers/i2c/stm32f7_i2c.c
 F:	drivers/mailbox/stm32-ipcc.c
+F:	drivers/memory/stm32-omm.c
 F:	drivers/misc/stm32mp_fuse.c
 F:	drivers/misc/stm32_rcc.c
 F:	drivers/mmc/stm32_sdmmc2.c
diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 7c40f176987..e31c4532279 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -37,6 +37,23 @@ config STM32_FMC2_EBI
 	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
 	  SOCs containing the FMC2 External Bus Interface.
 
+config STM32_OMM
+	tristate "STM32 Octo Memory Manager"
+	depends on ARCH_STM32MP
+	help
+	  This driver manages the muxing between the 2 OSPI busses and
+	  the 2 output ports. There are 4 possible muxing configurations:
+	  - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
+	       output is on port 2
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 1
+	  - swapped mode (no multiplexing), OSPI1 output is on port 2,
+	       OSPI2 output is on port 1
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 2
+	  It also manages :
+	    - the split of the memory area shared between the 2 OSPI instances.
+	    - chip select selection override.
+	    - the time between 2 transactions in multiplexed mode.
+
 config TI_AEMIF
 	tristate "Texas Instruments AEMIF driver"
 	depends on ARCH_KEYSTONE || ARCH_DAVINCI
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index fdc83e4e1c8..77294fac69d 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_MEMORY) += memory-uclass.o
 obj-$(CONFIG_SANDBOX_MEMORY) += memory-sandbox.o
 obj-$(CONFIG_STM32_FMC2_EBI) += stm32-fmc2-ebi.o
+obj-$(CONFIG_STM32_OMM) += stm32_omm.o
 obj-$(CONFIG_ATMEL_EBI) += atmel_ebi.o
 obj-$(CONFIG_TI_AEMIF) += ti-aemif.o ti-aemif-cs.o
 obj-$(CONFIG_TI_GPMC) += ti-gpmc.o
diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
new file mode 100644
index 00000000000..d5a4e1b0683
--- /dev/null
+++ b/drivers/memory/stm32_omm.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY UCLASS_NOP
+
+#include <clk.h>
+#include <dm.h>
+#include <regmap.h>
+#include <reset.h>
+#include <syscon.h>
+#include <asm/io.h>
+#include <dm/device_compat.h>
+#include <dm/device-internal.h>
+#include <dm/lists.h>
+#include <dm/of_addr.h>
+#include <dm/of_access.h>
+#include <linux/bitfield.h>
+#include <linux/ioport.h>
+#include <mach/rif.h>
+
+/* OCTOSPI control register */
+#define OCTOSPIM_CR		0
+#define CR_MUXEN		BIT(0)
+#define CR_MUXENMODE_MASK	GENMASK(1, 0)
+#define CR_CSSEL_OVR_EN		BIT(4)
+#define CR_CSSEL_OVR_MASK	GENMASK(6, 5)
+#define CR_REQ2ACK_MASK		GENMASK(23, 16)
+
+#define OMM_CHILD_NB		2
+#define OMM_CLK_NB		3
+#define OMM_RESET_NB		3
+#define NSEC_PER_SEC		1000000000L
+
+struct stm32_omm_plat {
+	phys_addr_t regs_base;
+	struct regmap *syscfg_regmap;
+	struct clk clk[OMM_CLK_NB];
+	struct reset_ctl reset_ctl[OMM_RESET_NB];
+	resource_size_t mm_ospi2_size;
+	u32 mux;
+	u32 cssel_ovr;
+	u32 req2ack;
+	u32 amcr_base;
+	u32 amcr_mask;
+	unsigned long clk_rate_max;
+	u8 nb_child;
+};
+
+static int stm32_omm_set_amcr(struct udevice *dev, bool set)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	unsigned int amcr, read_amcr;
+
+	amcr = plat->mm_ospi2_size / SZ_64M;
+
+	if (set)
+		regmap_update_bits(plat->syscfg_regmap, plat->amcr_base,
+				   plat->amcr_mask, amcr);
+
+	/* read AMCR and check coherency with memory-map areas defined in DT */
+	regmap_read(plat->syscfg_regmap, plat->amcr_base, &read_amcr);
+	read_amcr = read_amcr >> (ffs(plat->amcr_mask) - 1);
+
+	if (amcr != read_amcr) {
+		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int stm32_omm_toggle_child_clock(struct udevice *dev, bool enable)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int i, ret;
+
+	for (i = 0; i < plat->nb_child; i++) {
+		if (enable) {
+			ret = clk_enable(&plat->clk[i + 1]);
+			if (ret) {
+				dev_err(dev, "Can not enable clock\n");
+				goto clk_error;
+			}
+		} else {
+			clk_disable(&plat->clk[i + 1]);
+		}
+	}
+
+	return 0;
+
+clk_error:
+	while (i--)
+		clk_disable(&plat->clk[i + 1]);
+
+	return ret;
+}
+
+static int stm32_omm_disable_child(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int ret;
+	u8 i;
+
+	ret = stm32_omm_toggle_child_clock(dev, true);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < plat->nb_child; i++) {
+		/* reset OSPI to ensure CR_EN bit is set to 0 */
+		reset_assert(&plat->reset_ctl[i + 1]);
+		udelay(2);
+		reset_deassert(&plat->reset_ctl[i + 1]);
+	}
+
+	return stm32_omm_toggle_child_clock(dev, false);
+}
+
+static int stm32_omm_configure(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	int ret;
+	u32 mux = 0;
+	u32 cssel_ovr = 0;
+	u32 req2ack = 0;
+
+	/* Ensure both OSPI instance are disabled before configuring OMM */
+	ret = stm32_omm_disable_child(dev);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(&plat->clk[0]);
+	if (ret) {
+		dev_err(dev, "Failed to enable OMM clock (%d)\n", ret);
+		return ret;
+	}
+
+	reset_assert(&plat->reset_ctl[0]);
+	udelay(2);
+	reset_deassert(&plat->reset_ctl[0]);
+
+	if (plat->mux & CR_MUXEN) {
+		if (plat->req2ack) {
+			req2ack = DIV_ROUND_UP(plat->req2ack,
+					       NSEC_PER_SEC / plat->clk_rate_max) - 1;
+			if (req2ack > 256)
+				req2ack = 256;
+		}
+
+		req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
+		clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_REQ2ACK_MASK,
+				req2ack);
+
+		/*
+		 * If the mux is enabled, the 2 OSPI clocks have to be
+		 * always enabled
+		 */
+		ret = stm32_omm_toggle_child_clock(dev, true);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->cssel_ovr != 0xff) {
+		cssel_ovr = FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
+		cssel_ovr |= CR_CSSEL_OVR_EN;
+		clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_CSSEL_OVR_MASK,
+				cssel_ovr);
+	}
+
+	mux = FIELD_PREP(CR_MUXENMODE_MASK, plat->mux);
+	clrsetbits_le32(plat->regs_base + OCTOSPIM_CR, CR_MUXENMODE_MASK, mux);
+	clk_disable(&plat->clk[0]);
+
+	return stm32_omm_set_amcr(dev, true);
+}
+
+static void stm32_omm_release_childs(ofnode *child_list, u8 nb_child)
+{
+	u8 i;
+
+	for (i = 0; i < nb_child; i++)
+		stm32_rifsc_release_access(child_list[i]);
+}
+
+static int stm32_omm_probe(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	ofnode child_list[OMM_CHILD_NB];
+	ofnode child;
+	int ret;
+	u8 child_access_granted = 0;
+	bool child_access[OMM_CHILD_NB];
+
+	/* check child's access */
+	for (child = ofnode_first_subnode(dev_ofnode(dev));
+	     ofnode_valid(child);
+	     child = ofnode_next_subnode(child)) {
+		if (plat->nb_child > OMM_CHILD_NB) {
+			dev_err(dev, "Bad DT, found too much children\n");
+			return -E2BIG;
+		}
+
+		if (!ofnode_device_is_compatible(child, "st,stm32mp25-ospi"))
+			return -EINVAL;
+
+		ret = stm32_rifsc_grant_access(child);
+		if (ret < 0 && ret != -EACCES)
+			return ret;
+
+		child_access[plat->nb_child] = false;
+		if (!ret) {
+			child_access_granted++;
+			child_access[plat->nb_child] = true;
+		}
+
+		child_list[plat->nb_child] = child;
+		plat->nb_child++;
+	}
+
+	if (plat->nb_child != OMM_CHILD_NB)
+		return -EINVAL;
+
+	/* check if OMM's resource access is granted */
+	ret = stm32_rifsc_grant_access(dev_ofnode(dev));
+	if (ret < 0 && ret != -EACCES)
+		goto end;
+
+	/* All child's access are granted ? */
+	if (!ret && child_access_granted == plat->nb_child) {
+		ret = stm32_omm_configure(dev);
+		if (ret)
+			goto end;
+	} else {
+		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
+		/*
+		 * AMCR can't be set, so check if current value is coherent
+		 * with memory-map areas defined in DT
+		 */
+		ret = stm32_omm_set_amcr(dev, false);
+	}
+
+end:
+	stm32_omm_release_childs(child_list, plat->nb_child);
+	stm32_rifsc_release_access(dev_ofnode(dev));
+
+	return ret;
+}
+
+static int stm32_omm_of_to_plat(struct udevice *dev)
+{
+	struct stm32_omm_plat *plat = dev_get_plat(dev);
+	static const char * const clocks_name[] = {"omm", "ospi1", "ospi2"};
+	static const char * const mm_name[] = { "ospi1", "ospi2" };
+	static const char * const resets_name[] = {"omm", "ospi1", "ospi2"};
+	struct resource res, res1, mm_res;
+	struct ofnode_phandle_args args;
+	struct udevice *child;
+	unsigned long clk_rate;
+	struct clk child_clk;
+	int ret, idx;
+	u8 i;
+
+	plat->regs_base = dev_read_addr(dev);
+	if (plat->regs_base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	ret = dev_read_resource_byname(dev, "memory_map", &mm_res);
+	if (ret) {
+		dev_err(dev, "can't get omm_mm mmap resource(ret = %d)!\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < OMM_CLK_NB; i++) {
+		ret = clk_get_by_name(dev, clocks_name[i], &plat->clk[i]);
+		if (ret < 0) {
+			dev_err(dev, "Can't find I/O manager clock %s\n", clocks_name[i]);
+			return ret;
+		}
+
+		ret = reset_get_by_name(dev, resets_name[i], &plat->reset_ctl[i]);
+		if (ret < 0) {
+			dev_err(dev, "Can't find I/O manager reset %s\n", resets_name[i]);
+			return ret;
+		}
+	}
+
+	/* parse children's clock */
+	plat->clk_rate_max = 0;
+	device_foreach_child(child, dev) {
+		ret = clk_get_by_index(child, 0, &child_clk);
+		if (ret) {
+			dev_err(dev, "Failed to get clock for %s\n",
+				dev_read_name(child));
+			return ret;
+		}
+
+		clk_rate = clk_get_rate(&child_clk);
+		if (!clk_rate) {
+			dev_err(dev, "Invalid clock rate\n");
+			return -EINVAL;
+		}
+
+		if (clk_rate > plat->clk_rate_max)
+			plat->clk_rate_max = clk_rate;
+	}
+
+	plat->mux = dev_read_u32_default(dev, "st,omm-mux", 0);
+	plat->req2ack = dev_read_u32_default(dev, "st,omm-req2ack-ns", 0);
+	plat->cssel_ovr = dev_read_u32_default(dev, "st,omm-cssel-ovr", 0xff);
+	plat->mm_ospi2_size = 0;
+
+	for (i = 0; i < 2; i++) {
+		idx = dev_read_stringlist_search(dev, "memory-region-names",
+						 mm_name[i]);
+		if (idx < 0)
+			continue;
+
+		/* res1 only used on second loop iteration */
+		res1.start = res.start;
+		res1.end = res.end;
+
+		dev_read_phandle_with_args(dev, "memory-region", NULL, 0, idx,
+					   &args);
+		ret = ofnode_read_resource(args.node, 0, &res);
+		if (ret) {
+			dev_err(dev, "unable to resolve memory region\n");
+			return ret;
+		}
+
+		/* check that memory region fits inside OMM memory map area */
+		if (!resource_contains(&mm_res, &res)) {
+			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
+				mm_name[i]);
+			dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
+				res.start, res.end,
+				mm_res.start, mm_res.end);
+
+			return -EFAULT;
+		}
+
+		if (i == 1) {
+			plat->mm_ospi2_size = resource_size(&res);
+
+			/* check that OMM memory region 1 doesn't overlap memory region 2 */
+			if (resource_overlaps(&res, &res1)) {
+				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
+					mm_name[0], mm_name[1]);
+				dev_err(dev, "[0x%llx-0x%llx] overlaps [0x%llx-0x%llx]\n",
+					res1.start, res1.end, res.start, res.end);
+
+				return -EFAULT;
+			}
+		}
+	}
+
+	plat->syscfg_regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg-amcr");
+	if (IS_ERR(plat->syscfg_regmap)) {
+		dev_err(dev, "Failed to get st,syscfg-amcr property\n");
+		ret = PTR_ERR(plat->syscfg_regmap);
+		return ret;
+	}
+
+	ret = dev_read_u32_index(dev, "st,syscfg-amcr", 1, &plat->amcr_base);
+	if (ret) {
+		dev_err(dev, "Failed to get st,syscfg-amcr base\n");
+		return ret;
+	}
+
+	ret = dev_read_u32_index(dev, "st,syscfg-amcr", 2, &plat->amcr_mask);
+	if (ret) {
+		dev_err(dev, "Failed to get st,syscfg-amcr mask\n");
+		return ret;
+	}
+
+	return 0;
+};
+
+static int stm32_omm_bind(struct udevice *dev)
+{
+	int ret = 0, err = 0;
+	ofnode node;
+
+	for (node = ofnode_first_subnode(dev_ofnode(dev));
+	     ofnode_valid(node);
+	     node = ofnode_next_subnode(node)) {
+		const char *node_name = ofnode_get_name(node);
+
+		if (!ofnode_is_enabled(node) || stm32_rifsc_grant_access(node)) {
+			dev_dbg(dev, "%s failed to bind\n", node_name);
+			continue;
+		}
+
+		err = lists_bind_fdt(dev, node, NULL, NULL,
+				     gd->flags & GD_FLG_RELOC ? false : true);
+		if (err && !ret) {
+			ret = err;
+			dev_dbg(dev, "%s: ret=%d\n", node_name, ret);
+		}
+	}
+
+	if (ret)
+		dev_dbg(dev, "Some drivers failed to bind\n");
+
+	return ret;
+}
+
+static const struct udevice_id stm32_omm_ids[] = {
+	{ .compatible = "st,stm32mp25-omm", },
+	{},
+};
+
+U_BOOT_DRIVER(stm32_omm) = {
+	.name		= "stm32_omm",
+	.id		= UCLASS_NOP,
+	.probe		= stm32_omm_probe,
+	.of_match	= stm32_omm_ids,
+	.of_to_plat	= stm32_omm_of_to_plat,
+	.plat_auto	= sizeof(struct stm32_omm_plat),
+	.bind		= stm32_omm_bind,
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
