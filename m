Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGaTCVUaDGrrVwUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE4579ABE
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4CC9C8F294;
	Tue, 19 May 2026 08:07:47 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C0A1C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 08:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+BHaXz54wzpfjEaBwOnjh9kDBPIfeyuA7vafvYmkgkZzGUWqvxN/To3gnb5j5wal6Oc5nVW3QaO/FuShoVycxgJ4t/JXrDjqr9EDPS8cDR5bLv2mg0e0WMtVTZNP50G4/yLzKFHGPldbevASL0g/PcAGz70jxiXrlWQLGKQCMds4iUf/2RuawA+Jb0vik7IxoESHWjuTxTmF1ZeEA1l38JKZ2VfnGoEim9uVP735wVQt3dWwQOb++0fchnvmPNRZb9H71+qYbW+wVjlL5rjEGwmbG7Nmd+tDKq1J9FU5Dgkp6+ktWi/GjBN9nap7e5b5Mxk0o5F0RXkujKwReFd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVgpSaAwKuUUrtEwHhsOm2p8zUjqEWMZ/EauZFfjQ18=;
 b=r2XA7+sSjvCdFQ/+q5R34uRWkaSktcBSwRJ62477mo2OlHgM6bRdiZehNNMpqir11hRSclD5QoZaVdWqCpBXWOFrrKm7Rsjjbe0gvWxgugrsN2fSqM8qZzonXjXHe3qAfHGdSeFY21CToXfS6xpXEsTSzgNSliudVQ9jOMWJuExtgFsegzAyQfJITbFS1c0D2A8oHYmiDunXFRwilL6vAWJNpJIt2TEOHM+45EFmYCDK8q9EmfeUtMefXvvON9adtxEvdaMJk5fc9wzbpiinPudHFsUYrKvstTGHrdwBWlhfjBTYb8iCHJ/lO39xlSwdBrM6a8kuqv2OK5m1jNZK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVgpSaAwKuUUrtEwHhsOm2p8zUjqEWMZ/EauZFfjQ18=;
 b=Hpr33jH9Y3U/njAcMg1OWoImhhoZJJcxgRRMMJlfkMeavQ14zZuEXJnxiHit0bvVWsMMk++7VyDSXu877qc7n4QfGEFNqxlwQCrWk2/bns5URYWJqOM+twi0UyODm3x0AgkutfgL3n4Le9QQFCQ3//pj5Kp/M5KtDC0iDRb2cDjtb4hZbpzztXfSycHautt4hj7EmmfGvD2SBBENMe+npsPv3YVCTgp6iOF2HrGtTALgqQCiGlWRcFPKoRmsJ3jsE9hT4BETyFGZOyTOJXRs+ykw7cle/nEGJ7nD92sfF4YQBzAsiGuFWFBWB65KkOr7GsO/bEHtUU1BptjyBIgfUQ==
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by AS4PR10MB6182.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:589::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:07:42 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::48) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:07:42 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:11:34 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:07:41 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 10:07:34 +0200
Message-ID: <20260519080737.47928-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|AS4PR10MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: c0310158-c7c4-4bb4-a5ea-08deb57db3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|13003099007|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: ed5B4Bwst/Rp5Ddtl7zzhJibKO4Fhs+l1I1fyscJdDP5C0Mu5l9qfEiR7o1zHv+uAx6evlqJ+ygxBmp4gqagjxPTgm0Jvp9dZG2s6HHja4FmiTRcvZrywZzV4pHdFAiBMeabZOaCuw9sKiGWrITIzlvbT+GkPj4yYZPBAB0F7c5Z9sl6z79pE9cQKxEvgiqIirUA1+msrK2r8dzlQvyyQbNeoj4Ww54fYv49RTa1mztoJe73Gw82m8OjOZi0+yVCVJKJWEJe+oPOTYcDy7dngAhq/u7HsnyG/bQAfV/DXb/kg6NCYYvsdGu8One7DI8NMuziGYUm5fUaw6xcNoeSyK631bUdtpSS/wnkvm+1eQbfZR4UlhWXKyinHnItL+jOcRq2nG0UlzSXGHWPC15hAAmqApcFVxNBggrPmgXUGchERwdPs6hZXIQoHWeHCr+PgYqeg/tP2xvqnXvWmUf6AuQufs4ZqWawLVbSPSujo5gY4pmD88RHrqZ/CNuZbMiSCBd5THARKCyvqMH7lQZDZWlDs+BMdCOe5gTo3hvrWR0G26J1rqTCGwroWnQibI/xTnduBImVoUzcwVHhztXm2lA+jwvgEuWErKbJaeQbqL7uY7SBadHNFVg1nM8naQuVS3/qislazO0eLCg2XiH+KsKVG7/HFRi44tzbKHhSjkSVxIh0hkHeQnY/QhB66xwgE57K7mcuVG2LVYoC/kDcvlO4zBR6qt3u9ndmS7z7s0g=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(13003099007)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SJ/9avnFS4xbCccenPuAYffXZJ3/8bQVFA1C32rIlId3RAKqRAt7eukFI4e1LMH1DjXkKt2jNZzv3Z10Rb40Yn/DrvOC4nmCmQhySDl0/resn72+LWtPTkGjU1RMjGf3Ky9wJj+pqVdSTBJxnJw+jcTDZ6KFoW+35/EwgiwgakRNHYay3Nl/QnfxkxqWSNqOb+TvAe/TbBJq5JIROvBQgFM2qHIWr5Y2n/J/oxf9rCb3tV9ZYajNoA0muywWonokiXNfzGv8zS8tw0t7NNWcMf6lIlUOnVKvZaQs/s9jy16vh/pMtraC34qwXn/GWppCD9+Ld95MEnLzAwdIvE62N7t8JphZ6AnnZH7Z7/+RIQgWX+GrnNX7Jdf4JXC3vlW7kIK+f3IQ1EB9li+tTxv8adI4PV6uv3owyxjzi7o8YcTujsrBNcM5u2kcZ6/E5S0N
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:07:42.1786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0310158-c7c4-4bb4-a5ea-08deb57db3a9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6182
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/3] Enable Arm SMC watchdog for STM32MP1
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1CE4579ABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the supports for Arm SMC watchdog for STM32MP1x
platforms. This enables the required config flags for both STM32MP13
and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
in SCMI configuration.

This series also requires a patch from Patrice[1] increasing the
CONFIG_SYS_MALLOC_F_LEN for STM32MP15.

[1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518-master-v1-1-37fd4df56609@foss.st.com/


Lionel Debieve (1):
  configs: stm32: enable WDT_ARM_SMC driver

Yann Gautier (2):
  configs: stm32mp13: activate watchdog
  ARM: dts: stm32: enable SMC watchdog for STM32MP15 SCMI config

 arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 9 ++++++++-
 configs/stm32mp13_defconfig             | 3 +++
 configs/stm32mp15_defconfig             | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.34.1

base-commit: 215496fec59b3fa09256b4fb62f92af46e2ec7f9
branch: master
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
