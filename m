Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLWKBz7cDWpb4QUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:26 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68259178E
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48557C87ED1;
	Wed, 20 May 2026 16:07:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE16CC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 16:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n56qsGQIIql7tqbHXps4R2h7L/bEbwoyXiH2NRLUG2WvuPiHMsajw7bct8gFPbKAtIIkvEmJR59ea5r3p9Qh0DduhxFiKJgsbImg4kD55Bmkzmg5jQO7KU9Opf/sgD5j2GrXYy7/Cm2guEyyNXjynV36a+4XNqbGpa2m46JyDjHq04V3so0OYf98w1IcaCv30niJ/ckpxM7/mZUdUfhg+BTgkZlnG799nDgrKyzECe9HAHdAWdSx2bWhTE76HYqztg9f+y7pGZISlBu5oHWLxy7PQTqf6YHzZfpJ//EKJQNDRPBSIRnwPDobCKoZ2qenjksXI0X4oAkhIwY58YeqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUe036ShRYpcWT+7XLjtFoX+8vYUVySrqHx0vGKXiRs=;
 b=ybusNuVwdgJCoEbiAEpJASBmGfYQKqGOlSTSraJ+M6wqQ7NpEQ+LwqKuCsrrN85A9wL5TT5s5IW/idpjY78wH/B7GY8zrhfmqkN6T2CrblPWjPCowPlvyXN5rnIDPy9j8KZ43LVdOHPQYWj2SEA5Mg+/Qysc9dRFiTiFKpgJMJ0qZUa1lqVairJ0dTLC+wS4CzdX9AZlXZIaLsT7ywfvrdmTT8T95aVSoAk/SaZyXmDvRtB1riXQV4t/ne9d5V3eYWzV/pORhQvVmeh7KItPi9yKq60xOESAfej8Q4MPZWgIlaoJyrNWuGuqHnruh9sFlGLIJY988f3vwtku8GOUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUe036ShRYpcWT+7XLjtFoX+8vYUVySrqHx0vGKXiRs=;
 b=MvfGELWb1FVwhILl/y0fCsx/PczZaNqKbeaX0W2lqlIyxqtf/PAOxJivYzKnkDCFyjTRj12ih9m2K9NmrEOftHI+c5Eyfqrjgas67B2gfPaeLginfcasZ+XKo0Rkr5pYp0BgZ6l5t88N3Au9brgycUuTFndHVx3y0dtPlUaRHnHLd3UzGnbn7o7LTLOrzgscxnkLrynnmTY3kSIMfWWYvL9iZF8h+a/mhuTe/neihwl6rpWAsUZvKM+ZkOsDEkDkMOAEXNdDMoPf1cXy0TNDUQt4Hk5tzYDZuLkaE5kh4y1OAYs6hLiQJXgGb/LRqU8UWiEQ6/D7mub7iCsELehpbQ==
Received: from AS9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:488::22)
 by AS8PR10MB6295.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:560::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 16:07:20 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:488:cafe::6c) by AS9PR05CA0018.outlook.office365.com
 (2603:10a6:20b:488::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 16:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 16:07:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:10:49 +0200
Received: from localhost (10.252.1.215) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:07:19 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 May 2026 18:07:12 +0200
Message-ID: <20260520160715.175032-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|AS8PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c795e07-a02f-45af-9724-08deb689df3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|11063799006|13003099007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: PP70IerOWipyEqYTzE7raRgNourBNVrZTWQy+gy/zmvSjstkaB4HI0k0nByT1vQFXhX98hlMkvOcRNa0HF1/opPqm8E75hUkcHlaqwvJbJzHEBSk4QI6eTjSNoT6eQmppWcxcUsaD64mEyTvCXN87+zk9M3JU0Nl2jVIU1NoKcsvhmydUDBenntf32ro2Y0c/V11K3Re4Hw8qngpVsOH8MFoAXGIs1mJ3i7N22U7S6mNxAmMH2Gp1paDjO9dNlKWIRLl0Mn3pJ4cWSn5A51vENMbi5ALKzTdDLCmr/stdp7h/7BtN98T5AMZoAJ3TPciI9VWi53Y7nmmVr94PFx/Hg+r6m2ASDOiekA1PWb2kmppie8aRQ1MFZhk5Nwjc19UxmsJmZfVqNFXiaToAnxGJpZFw8yeOUuyf1e3LLjC+jNc/NUW8qhCJeaMkCHVNk1hk3czd9kfacxKwwAfASG5LMpDuo5IbXzxIJZVFrJeFanUyUFJXapXmm+K+L5pb+P1eM7qLbnjfAd22X3Vkz1j9KUXbhLE5NgVr+oWu0ZyMGcrYULGYe07Hu7FDjesCTda51x/+VEkRuDCxbY5JThReKv6TxXNPNA+uZX23DedlH0FdRxZxu7xQcFmf5z8fPOmF39fExtULO2ohqJlcG12Z6qopGPI+5qLejVh+V0vnmufgDI7UQ2UMuuZ6ZWPiw+9znw8uzGCJ7B53M4J4E0ls2JbL7j+Q3CDrpzsTplZtzc=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(11063799006)(13003099007)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XlWJmEQSvZaoeXwB4+dgrvY7/8J7ZvFPGCRZcb+7iVKumQMKS1DP9oFwMuX40K9TRhC0buSq8LgtmCp/4vhqOVeNbabTHlh0qMWM6pPtbRdzg11pzGFCwBtOmwuVCjZQqx2ESkcHgUY4XVhDEFIHmPJwnj3WL8d9COH+hREvX6NSAawPHHVuNvm5e15fBS0rI6g//xVT5zNmDxjRFB92LeSazdJu8h1aVXpfTTdlUGfnEE9OsUrdlv1lSfxvwgDXCxZFPP2zx3Pqgi6dXzu/QxCJyffk5UpfBuNX8pmskfzzQ4QhhKcUVZLWmNI1W5zpvTqXqQtl/tGCsAMvnPIg3DCUvl7K4KE/K9ATsldx4gVLFATiEXe02Y44xuouaSutefbFz5pya28/O6hkubWtgJXsnUnx9IaWQzF9PLJhbrkyOy+IEshfYq19iV4ADbAE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:07:20.4541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c795e07-a02f-45af-9724-08deb689df3d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6295
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/3] Enable Arm SMC watchdog for STM32MP1
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,ozlabs.org:url];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC68259178E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the supports for Arm SMC watchdog for STM32MP1x
platforms. This enables the required config flags for both STM32MP13
and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
in SCMI configuration.

This series also requires a patch from Patrice[1] increasing the
CONFIG_SYS_MALLOC_F_LEN for STM32MP15.

[1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518-master-v1-1-37fd4df56609@foss.st.com/

Changes in v3:
- Update patch 1 commit message
- Remove CONFIG_WDT_STM32MP for MP13 and update patch 2 commit message

Changes in v2:
- Improve patch 2 commit message
- Add Reviewed-by tags from Patrice for patches 1 & 3

Lionel Debieve (1):
  configs: stm32mp15: enable WDT_ARM_SMC driver

Yann Gautier (2):
  configs: stm32mp13: activate watchdog
  ARM: dts: stm32: enable SMC watchdog for STM32MP15 SCMI config

 arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 9 ++++++++-
 configs/stm32mp13_defconfig             | 2 ++
 configs/stm32mp15_defconfig             | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1

base-commit: 38dbe637c9dfcadbd1bc201bfbb27f96b2ad525a
branch: master
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
