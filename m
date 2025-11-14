Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA392C5E32F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BC53C62D48;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2983DC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGAttP2657499; Fri, 14 Nov 2025 17:24:26 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvqg-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:26 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/nlRdPp7bZUW2qDOXM4GH/n9y4oSDKVlEJVOKLPlfdauhIR6fx6EbeQKQ9S63rMDQdA6DPxm9p6wU64gp5IkkoUNxuDYsfWRMrq2r6aW0rY0cmqkgLbvhTW6seh2uOcXLaQFId+79/xpKezxms+qeuoY/vfxqLYL3hhvp1PsCE9+xYgDHDFysUratfihLtEFdoQ+RazFT8s87HS6FSMio/UQsRUZgSO7GXLdCTSPZWWrxdtXRn7GoPY0g4B4IFAU++QIxPExRu4Dm2bQRJnlT9sD24J0ynvnmctdjWzgx4CC/BnFRn0xVNC8R87lhXoWV6rtraEQ36TCWERJvNEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAMbZQ+qpRsnphVR6mmqJqm/ehHQiAfaktfxa4fSpO8=;
 b=nybXTMyfDvOsTjGHL3J4PPyCbg61qyA0ITL6j2uMutr9gHSZ+tksOw72l8JLbSbTZEaLxJuqH030dv33BuIt+aDPNaYRFTsRfDihlhLQk3DWxMqG8cJ108VUYRA4qmae4ZsV/eoDBUeePBT+LMH2rlbyhue+GNJ3aTFEuxmrTD3rEM8JWyMAbZ7umK8aoXC3TAffi9/cDaP7MxHnasFLW7X8pmm6HMldqLTJnHghOdC+eQ+h/retNhB/lsyQjBCe5kqO+59XopJbeOJYBVdtCSACiyA8BFOEDXt63ZDbFwnR3zS7KzDxQcifXiPFamqDa/e0Fx5rzTiQzlSo1RTkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAMbZQ+qpRsnphVR6mmqJqm/ehHQiAfaktfxa4fSpO8=;
 b=L8wpr8f1Wce3Aj8/NtoXJWS6XUBfZiGSqygYIGSvGAHysi5guEx8GygwGkdtrgEQwKCoK0VP4Smp6ofxmlu9ZAYx2Se1e4uQricil2Npu/Be/P98b+O75K4MbfS+k1IVbcyXvOEE3GGm/YBNVPfYIW4lbiCw1y/inJA5o0gmaEE/E1i7S6FwV0oseRgsC+x41Ypv7EniiG2IYepd5+WFaCppN2UUXxUb1XrcAIBm9fBToNKviC5bhxgLIWxshaX1EP3LKxcPrEtL4dAmhT3xfElCY0lVae9daSfAwQLG3FCRV0vakqwlB2nAJDt5PGbc1rdeyPmxb7hQGgR/E6lysg==
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by DB4PR10MB6989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:22 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::cf) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:21 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:32 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:20 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:34 +0100
Message-ID: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DB4PR10MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 401cb34c-1755-4e9a-e568-08de239a44b9
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7416014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hgiHxKj2JFTadqR+LMryf2ZNk/U0RHTg3foaIOlLig+MXcOer4xoRyuCKsM0?=
 =?us-ascii?Q?cDbUQBpWhp7Km0/UyguaWNGsIpmpQs53fjzdJZkLA7NiLmyLoNPzZKdP2u1f?=
 =?us-ascii?Q?hfMjihsj3SUzj42+92BWiEaEDPuZyuUNzPxCAa54Wgp8uJHvxv0iU90H2L0v?=
 =?us-ascii?Q?+4xEeonStSIeOUDX1XOstsyQYqCGaXLN5yZsgAl891clneJh9ZgCC2NH6C5y?=
 =?us-ascii?Q?Jm2og+ipOkaHh/bKpylCJOEXGKJws9bDKw4RKy2rGTD327L3TbRBh7ZiItZT?=
 =?us-ascii?Q?jhcyPFUhueIVoGTSrOsNCpiQKNFPtP7ARyCTeURDepuEEyRSwNzoO+0+71r0?=
 =?us-ascii?Q?9dnPdiGORWoWg0RLTVbWKzaL4KAzBAARYHQkt7DxaJtOcNGbAajD2wkexd9D?=
 =?us-ascii?Q?IMzS9t29nT3CowHywvIB6+E2wgHtZeyRoBs9b4yzSNRd19zKGMU7G9jUQIR0?=
 =?us-ascii?Q?nX0e2u/Dvb8epKi3IvE5JdK57zYeV+ylvuH/g37v5axfScZvvyFUopavzDrQ?=
 =?us-ascii?Q?ta9qA5NyU99VhL0FOd6Kn0miYyHDvczMBYrq8qJnZHdmwywWJ34hhCNzDXMs?=
 =?us-ascii?Q?rMl0xPkuEVOaaCoiAQG+NEkg9d3ljbJYdQRvRkGVzxruiuqCEN042FEQV0TD?=
 =?us-ascii?Q?rY8UVM6C8/8tjofspAZOW7cVHn6DCmpOwN4AdvWjvLDTXBla4mpbgu0EuDFX?=
 =?us-ascii?Q?n7Wazp4va6B/7Efv9cI3WmTIMOPopAcCT3WQ5oZXjGQZAc7JGNsN7tYh6KJF?=
 =?us-ascii?Q?qBwKUdSk0F6TeClNt3X9tK32qsUARh7NOh8OZm9m+CnCK2ASuwfGa1mrIj9M?=
 =?us-ascii?Q?4etVcH4hY39e4SF/722yldEB9l+1FlBddTSf+hsonxLhEMJcFhdPxP9Vwv6W?=
 =?us-ascii?Q?tWBv+9MIvDA3d5mDrXjdRf5jHCG44qxo4lBXlDQDfsPO+E2b0aklcJPFedaT?=
 =?us-ascii?Q?AN/YZ4ryn7ioLHU8owbyUiCcSeJSH3xgyswUo33GAfhjAMzUJsrEBOm8SDyR?=
 =?us-ascii?Q?WJC0tQUt9YA6lTniIsaTGTkkjnRaxi0RAioUkYqsieEeda+kSCioJ7v+V5YP?=
 =?us-ascii?Q?4HP1UUfqMnzB407txdR7S4GvSNV9Bx8iJ2zQjCVDvtINrBkXzcdJRT+5vBZ2?=
 =?us-ascii?Q?7Jy0WnHhfYZKSTgWFfdPVH7P1SfAgLzrWiEAahCYoYyxwkKAXHFySkFLPF2C?=
 =?us-ascii?Q?crhfBludku3++e6RN8OZnYD9m01cQXzqTnSzOs1+v2m6syGcxXp8ZE0+tDEn?=
 =?us-ascii?Q?Lz9hvgCASImw97cRUXfd4oHZtrjSlMtB0o9fDGGhOuV3WR0/AaTju8w8orjw?=
 =?us-ascii?Q?QyYXKvsravqvgwQWm3DvUQSAh4t5XNXdVNoOSJD5QYMBbI19/2OppxwdGQGN?=
 =?us-ascii?Q?QBiAXMxWAcG73RqvGA2YhtUZTpVA3ojcpbeIcZJcSU6RE9CtRnuwS2pVdMd9?=
 =?us-ascii?Q?xN4eUsfSuU+0xv6x4bfLIBWrAOOXhP0vjtEKQgKSwoiM796JtzN2LURZIIG8?=
 =?us-ascii?Q?01b7iNyuq5lkr8dH3Vmq80WsXT24148KtAIGyI7NxGM65vc8IfucBVtx38S0?=
 =?us-ascii?Q?Mu0mmtHT53FsIvHf+wLJuO67k1zb79SGkaVTTpye?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:21.7260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401cb34c-1755-4e9a-e568-08de239a44b9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6989
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX8uk3UVXtUTcG
 7giyNcyWSmktt2PqA/2Yw41SoADx3sc68N08LGFh96fDaXWs1KGRSgMYdvRhiH9KaaR7TW3ez5Z
 G6gKv+I1ZpuUdwJIhPTP1MtImhIMUqZa4yI9yndvdM3Ni0inO5hGnujQumqdJ7NTOKnI2OcynOa
 KR8eQ4KESGOlhZKeqZCYCa+nyEEZl3pJahcO64kv1f5pNLRKf0AGl1Ggsab+g97rIquGR9JovG5
 r8jy5rlLUzGKXfR4o8UjtCZJmoqRq/fdiMloZXgDR/9AmooSkMuUJZNB+qXEIaAm4SmFJz1KAqs
 PZ7g8x3BowXtlyrDsTm8SO+Qeb9XjmajzcFNGTSygO5ir9SsaKSIkZMGr9VO1kJJ2DgO+HAXxMe
 5abLaz5mKvQpG5wWrLBfWw9rOP2F0w==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757ba cx=c_pps
 a=qdy8P+eQIupL8Qc8TCRhJQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=voM4FWlXAAAA:8 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8 a=m23vhMZoyrbWW-71Zp8A:9
 a=IC2XNlieTeVoXbcui8wp:22 a=bA3UWDv6hWIuX7UZL3qL:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-ORIG-GUID: w2wTK4nvyTMB0zG5WlLmpu_XGVvU5QkW
X-Proofpoint-GUID: w2wTK4nvyTMB0zG5WlLmpu_XGVvU5QkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Linus
 Walleij <linus.walleij@linaro.org>
Subject: [Uboot-stm32] [PATCH 00/23] stm32: Update led management for
	STMicroelectronics boards
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

Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
"u-boot,boot-led" and "u-boot,error-led" properties can't be used anymore,
and in addition these properties are removed by series [1]

Instead, make usage of "boot-led" property in /options/u-boot node ,see [2].
"boot-led" property is added in kernel DT [3].

"u-boot,error-led" is replaced by LED labeled "red:status".
"red:status" addition has been submitted on kernel side [4]

This series also :
  - Remove no more used board/st/stm32f429-discovery/led.c
  - Update LED management for stm32mp1/2 boards.
  - Enable LED_BOOT flag in STM32 MCU's and MPU's defconfig files.

[1] https://patchwork.ozlabs.org/project/uboot/list/?series=481840
[2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
[4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1023034


Patrice Chotard (22):
  board: st: Update LED management for stm32mp1
  board: st: Update LED management for stm32mp2
  configs: stm32: Enable LED config flags for stm32f429-disco
  configs: stm32: Enable LED config flags for stm32f429-disco
  configs: stm32: Enable LED config flags for stm32f746-disco
  configs: stm32: Enable LED config flags for stm32f769-disco
  configs: stm32: Enable LED config flags for stm32h743-disco
  configs: stm32: Enable LED config flags for stm32h743-eval
  configs: stm32: Enable LED config flags for stm32h747-disco
  configs: stm32mp13: Enable LED_BOOT for stm32mp13_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_basic_defconfig
  configs: stm32mp15: Enable LED_BOOT for stm32mp15_trusted_defconfig
  configs: stm32mp2: Enable LED_BOOT for stm32mp25_defconfig
  configs: stm32mp2: Enable LED_BOOT for stm32mp23_defconfig
  ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
    stm32mp135f-dk-u-boot
  ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
    stm32mp157a-dk1-scmi-u-boot
  ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
    stm32mp157a-dk1-u-boot
  ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
    stm32mp157c-ed1-scmi-u-boot
  ARM: dts: stm32: Drop "u-boot-led" and "error-led" from
    stm32mp157c-ed1-u-boot
  ARM: dts: stm32: Drop "u-boot-led" from stm32mp235f-dk-u-boot
  ARM: dts: stm32: Drop "u-boot-led" from stm32mp257f-ev1-u-boot

Simon Glass (1):
  board: st: Drop old LED code from stm32f429-disco

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi       |  6 ---
 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi |  6 ---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  5 ---
 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 14 ------
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      | 14 ------
 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi       |  1 -
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |  1 -
 board/st/stm32f429-discovery/Makefile         |  1 -
 board/st/stm32f429-discovery/led.c            | 39 ----------------
 board/st/stm32mp1/stm32mp1.c                  | 45 ++-----------------
 board/st/stm32mp2/stm32mp2.c                  | 38 +---------------
 configs/stm32f429-discovery_defconfig         |  3 ++
 configs/stm32f469-discovery_defconfig         |  3 ++
 configs/stm32f746-disco_defconfig             |  3 ++
 configs/stm32f769-disco_defconfig             |  3 ++
 configs/stm32h743-disco_defconfig             |  3 ++
 configs/stm32h743-eval_defconfig              |  3 ++
 configs/stm32h747-disco_defconfig             |  3 ++
 configs/stm32mp13_defconfig                   |  1 +
 configs/stm32mp15_basic_defconfig             |  1 +
 configs/stm32mp15_defconfig                   |  1 +
 configs/stm32mp15_trusted_defconfig           |  1 +
 configs/stm32mp23_defconfig                   |  1 +
 configs/stm32mp25_defconfig                   |  1 +
 24 files changed, 32 insertions(+), 165 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c

-- 
2.43.0

base-commit: cc970522dc2f33080b44e455ac213c95199df56e
branch: upstream_update_stm32_led_management_v2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
