Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE79BC9701
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 529D0C555B6;
	Thu,  9 Oct 2025 14:09:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0828C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DgFBf020486;
 Thu, 9 Oct 2025 16:09:04 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4g0e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3aipgSgGVBlbPSvjZX2mr0r7uVS6IJGBduE6G4RRZaC7/SCMrlBhulmzxjbZ2Sd0VXG47CJQ4nVadVt6TdAxixhIWYXDzR1Vog7Tn0KXL5+J29zG5YaQFyOjEU2TbGtSA9U+y+zKUEqTs3wJ6BHJy0qGZMHOnPpnlW3Bc8y6QuLg39lJvwTJChZGzhiHApbt3BCX6KxAdeAi8iw/yPwzBS32tG7Ad4b70MHZN/56qHNsnKGyGWmY6UHpFtlOug5RY96Zqd59Zkqi+JkEHnK0kF/Qod7dvANMK0s8JPVn5BRqX9tN/BogL/RI++5WRRds0Ggm0W5EypzVX52XYrqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlbqtiBZhn/FAOCpHKWI/LF2oaCrxBX9U73c7ZEFfAw=;
 b=y2TkQNDlV6PCGCg9/cduFt+mtXo3ygvuQak4MKW7hYTaUE9aVgdvD1/qXDzJBGGO0iBGzRSk1C2VP+srNXScccQnJT/1X1QRi9Rb69ggE5SkCnTvZ+FZsvMqZgwtIs4BNtdu9eOOGQNfzYOMlLW3pIOKghGPLLq+5XfMdB2TitZ4aMHD4FTDuUt3htfS0xaBeRYRpEE2pUDF4x9RPfGlFbZNGMaY5an7rrXvwikn+A5rj/kPjEj0ajYJmhQIT+gK+aTHtM7fkiQrbuDxpjPlKRQXmA6pmHGkyt8/lxnk0bw41lVjFbtH5h8qwN2a9/6HqBB8UiXDcNh6hWZPAAzkgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlbqtiBZhn/FAOCpHKWI/LF2oaCrxBX9U73c7ZEFfAw=;
 b=OadbBHKPURaZqkt/HMFi45xDIiMlp/kMRKCFfha9n+OKBE0PSZ1jxjMte5pef0pNXoIynzrYV8EIzHTegPL+SP4rIanlO4eBd+HOhGhB3EoLVStL2tZ66GFbgCxkMHWaeYem1bZwTWw/M+JlZ4lAeQ4tKbAV26OhScwWYUQ5rnrL7VvhvhaWWZ7aDtdEljSiafrrYj/dIe4FzBZN6q9Pyh1di9naAl0Q/pobgfP5jSu3lk/kW+60EgHmOSe9do/mIwdsrIOf8mmxSgJznV7j9eLHSHlE4Q3EKHv7bunyQy+FVnOGnyqvfgCOb9OsMSaCwbxcgQ3EDl+Ff4tKn7MBRQ==
Received: from DU2PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:10:234::31)
 by DU0PR10MB5170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:342::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:08:56 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::dd) by DU2PR04CA0056.outlook.office365.com
 (2603:10a6:10:234::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:00 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:20 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:54 +0200
Message-ID: <20251009135417.282290-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|DU0PR10MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 141fd30e-e31d-425e-1a59-08de073d62b2
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LmNO2zbRgpMNCtMV4Zk4ppFNkrjuDdnT4hRAwSFVcy0ljtWUek+EAu4goAnl?=
 =?us-ascii?Q?laydh5IObKh60/7W/B5QwB+w7LxLnLHm+/4v+aMi9kqLMSe5Ov0llpqcXKvn?=
 =?us-ascii?Q?5vG5wBCqJXJ4qGD0/jMhRwTW07kWAghbV35Jt+fqXcmv5Ak90DQahe/uai5c?=
 =?us-ascii?Q?8h7YxBOZE7H6srI5my1LOuwYFV3BzhM7GA8pXX4Tq84NVtUCC0Gw8lZeFfa0?=
 =?us-ascii?Q?3/PGaUUIwWauNsIzq9kr32DYy2MmsPyRuwdlCKHMlKuTRStDahJSSpNu030E?=
 =?us-ascii?Q?bta85PODQ0xfpQkodut67qjopPdWN+yeA3urnzUPBD3vUhotPc+fsgRMyHbN?=
 =?us-ascii?Q?dUqc59j/4bYOPsGheAkxaE1ANfA17lEuN7WqbnthfK8WNFHYtDDhiuyIdeHf?=
 =?us-ascii?Q?qEozqOcXZhiPxhXBmK/VKvDF4OrzogCnhIZxxWlzdKYTdCITtI6vy1yoUYA5?=
 =?us-ascii?Q?ZimSdKEj3ia/vqFqQM0qfDqM0c5doDOdwdoTVL3OZ3t0eOm1/9JiTj5hOXNb?=
 =?us-ascii?Q?Wik3DuRX1GwRQUDh5ZqcbcErJ6D4lAyzOcYoshXJkdST5P/yHrkQFI+MNx0a?=
 =?us-ascii?Q?ry2ch170NWjieyMwTL3QlJ1t7r2xqVKakmaXO1oflh6eaqBw5zvn5JorJKlB?=
 =?us-ascii?Q?QZFoc36IXSZxtNtmq3LOXG+I2nXqvt5dp6Yf8wLvuKxruL5b0qyXtxToFqof?=
 =?us-ascii?Q?fm81GGFp4ixzZmLg1x79LrT5ggyhI0ZC2EJLiKOMWrmhyexaaL6ElDmjefTp?=
 =?us-ascii?Q?51fcDZCz8JEJ7Ze5QFII7o0Dd8YAdAZG2xfMjRLMRRrn44u9EAUI630KaS4p?=
 =?us-ascii?Q?W8PdIlz88PJ1ujviX6nwd46v1+5RrilbXtuQDoYjFSQcEpgMsg8fGQHKxXKR?=
 =?us-ascii?Q?iFC/55GGhSTadJIFR7Y+R9p+0O6dHuPbdCJXKVNKuIGmJLn2kUMDKMCi+Aje?=
 =?us-ascii?Q?JiujWbByhuVSIB1OzkpflcUeGFHgD2UWxq2owgVLf4aVn40uTeUvZ7xJdZWa?=
 =?us-ascii?Q?Rx0djY7/6wUn5jym2NnRqb99Rjf+R3XcWKslVM70IHk/aBrulWTgAphkJv/1?=
 =?us-ascii?Q?J88yKPaRx6WsQSpnp6aKO0jpLUV8V95qJttSxAMe0qTDs7ld0CtC6hIjHB5T?=
 =?us-ascii?Q?JijcHOCMevNpNwvmnkbM5KigZAkANt7jpigUS7wWlDpC+kNsx59XRIpXo+J/?=
 =?us-ascii?Q?200tlS4T/HyLb7vcRZ5y9H49zjAVDkpXMAK4fxv91i0J/6W3cwPYM4NuupbD?=
 =?us-ascii?Q?DTtr2LegnQzPKbatjJLmj2EJwLld9vOOlMTUL8UGBn+3Wkd/DJ8ktw9jEc30?=
 =?us-ascii?Q?BdzQByFXRCFsXQ9Ky0+9vWl9Cybx2lg462MtDnbsZm+a9/T8MFEYdGFFwLXl?=
 =?us-ascii?Q?wkoSPwReAzaSVSQMgOr2Qut8f7nYXhjewszsmufvYtJnHG3tc5mD3mIsNVX0?=
 =?us-ascii?Q?QKi00szBRxx4YUCD2iF2zdMP06Z9jWQZXM03d3h+Up/T5Lhe5O9a/d1v1de0?=
 =?us-ascii?Q?Ys25DQDIPUsTkna19X6oCClWWMhSbtqGzNtonUQlbjEF+rT1xgu+2gJPF20n?=
 =?us-ascii?Q?0MLs3prXzn+ZPlGXM8E=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141fd30e-e31d-425e-1a59-08de073d62b2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5170
X-Authority-Analysis: v=2.4 cv=S+/UAYsP c=1 sm=1 tr=0 ts=68e7c200 cx=c_pps
 a=se+yJPMsFwuJT1Vt2rpbKA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=3iwXmEdJMHE0Fq_5nUIA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0rFTXjYQXGhM
 +FBLQe9AdXnOjZHLuQxPoL3agUp8qr4dqeo5a/8YzmKXMj/gqtLMpk7/TXwdBRBSZH8/TvNb1b1
 XbrBItwOTnCKCBaD47NdawikYY+OkOqfowDM2r3PaXJH+u35PRN9+xFLBf3l/czd5bDCshFfCbH
 K06I0y+6L5/9ku1EYer5XLjq4QpZhY/EYGexMh8FPWtxS8SdiLnYt7TUGYEVPz1nEiP7xF4ycC6
 IZ1oLTBwpFqwPi694I9BYZHa3BoCuMyunWrwzZRaBVNeyyT5MA/h7iDTOPMn4XG22TS/TYgioS7
 shkOR5X3WLFro26fzBaNlI2/E5dOMAzZQK7QyhQZejMUwWbAetbC3mc4zSHBhvrZct4NGN7vrOm
 PxG164ceGuCdMSX2Yx6Qoj4Jnj0vdg==
X-Proofpoint-ORIG-GUID: 4tieE2tCCT3wwKQ041oZ__zrI93fSh1P
X-Proofpoint-GUID: 4tieE2tCCT3wwKQ041oZ__zrI93fSh1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v1 00/11] stm32mp1: Update led management for
	stm32mp1 boards
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

  - Drop old LED code from STM32F429-discovery.
  - Update LED management for stm32mp1 boards.
  - Enable stm32mp13/15 LED_BOOT flag.
  - Make usage of /options/u-boot/ to configure led in stm32mp1x-u-boot.dtsi.

Patrice Chotard (10):
  board: st: Update LED management for stm32mp1
  ARM: dts: Update config node for stm32mp135f-dk-u-boot
  ARM: dts: Update config node for stm32mp157a-dk1-u-boot
  ARM: dts: Update config node for stm32mp137a-dk1-scmi-u-boot
  ARM: dts: Update config node for stm32mp157c-ed1-u-boot
  ARM: dts: Update config node for stm32mp157c-ed1-scmi-u-boot
  configs: stm32mp13: Enable LED_BOOT for stm32mp13_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_basic_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_trusted_defconfig

Simon Glass (1):
  board: st: Drop old LED code from stm32f429-discovery

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi       | 11 +++--
 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 10 +++--
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      | 10 +++--
 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 10 +++--
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      | 10 +++--
 board/st/stm32f429-discovery/Makefile         |  1 -
 board/st/stm32f429-discovery/led.c            | 39 ----------------
 board/st/stm32mp1/stm32mp1.c                  | 45 ++-----------------
 configs/stm32mp13_defconfig                   |  1 +
 configs/stm32mp15_basic_defconfig             |  1 +
 configs/stm32mp15_defconfig                   |  1 +
 configs/stm32mp15_trusted_defconfig           |  1 +
 12 files changed, 44 insertions(+), 96 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c

-- 
2.43.0

base-commit: 5b69eb7c3eef4964112f6010dfbbc421f29940ab
branch: upstream_update_stm32mp1_led_management
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
