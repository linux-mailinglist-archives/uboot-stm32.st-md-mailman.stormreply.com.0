Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEUYAnqQDGp1jAUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 18:31:54 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574815826A6
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 18:31:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68ED4C8F294;
	Tue, 19 May 2026 16:31:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B403FC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 16:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehS3mYywaE4L9Pjh8ErWEUkFc+uar1xzC6fGpVQuVzNehNsBjrN4nVEpdhAzwc4aO+JNz/TlsIU36yAe1q9qgiy71kEodNcokcKaTuNR+OAJ53LujOS2LgIqOc6wDnEMVgBTdwKBjMeKcOfga6xZ/SC7A/qBwCPo4gdmKaMO/r+GNgzigGwhxeKshrUNa4oyKwURUYNfKNV2BREhr2tqRIGw3Y4MQJPLKGR4LjYc0KP25pfMYhPeSHXAHjX/hYQzLK2t5ufvQ6B8wIAyT419COd5fBKKNBD0TS2oMBOHZsp0Z6gOpD/NPFJWhTwgT8lE4zdkiuzzLWuJcEmdnjbyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNmWfDKQSpeVqX6RzUWYnFT15uuEuuzQ/FlkDEXwWKY=;
 b=D5MwUe2cF471Ccgf2x8ImXU7KcC3DYRf3vmxPOu0tGVxubQUlNOmWHzcXaE6Ep7uA9vrXOtFA1r5EC84EiW5Tt8kqazK8jc1okL58tTqJhYGwLFygY2gY2WomQZMdd3sMYRK2sZzP+JM+vpKXkf3YwIaq7L9yE+8GPLWyRYpMwrEIapIV67CWUPdMqQwRW5EZSrHJpWNa/M6CjBgvnSMoV7kyVmrPWRKvtnB5RGm/njLBW1qIpg2uxvCszG3qrxALF4zQQ+iRPNNAhWmN7W8HfBdFqQC1HLjUVea3qJu+jjIeO3MPyngvXtyrmMShrjg7jlA60ZSoP2bfFkXU1ApTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNmWfDKQSpeVqX6RzUWYnFT15uuEuuzQ/FlkDEXwWKY=;
 b=TEy8XYWo1z6Z18rlefsdZyiept2LVrqeHhg7X95M0lQtTlo1nvauZDJO/4BJjrj9WUexsmsggWSa16swuh5UVkK+upEK55QKyNxTJak2Hitl0eYC0rCi5KqupZNYF63NBfzpbiunP1lgDh/C5iHhll7u9gMR6INh9X5cmauWJNk4QwGdsI8wGm8Mi8Mwwy1AJAkXLvqOw1+AjptAVvoFG16dXjzqslIQ/S3kHuQHQXUQIXqeT8CMi6j1N5PyuqlGZy1dnrcmKvZfLvkFP3UjURsbEyyf8bdVQWVwftxbeKNkLFK0w+qTvupWQAgLjiNxB97I32qUntT5z6fvIERdUg==
Received: from DUZPR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::17) by AS2PR10MB6427.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:546::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 16:31:49 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::6e) by DUZPR01CA0158.outlook.office365.com
 (2603:10a6:10:4bd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 16:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:31:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 18:35:42 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 18:31:48 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 18:31:41 +0200
Message-ID: <20260519163145.221668-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|AS2PR10MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cccbe4-f540-48bc-ebe9-08deb5c42039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: S4LI3F84Htowd/avzedOBbiKuII3fjrcbDNylIDNcLt0lVQ7dGit/Pk/xNplZx+dntkL9kuu2Q/BtzcbPxvrxc294jRloZlvPVQ8iLi4hPp0BUJjE35tCJ9fQeOH10KR9bIAizqEHCwRvZrxI5SJVn7UmnK3ny3P31F6dekWHZkvrM/eTNe4xr1UYlbw88rKROgOH4Lr/OhFK9PA/+7j/r8Igz/T7XyKOEsUNeVG5UTSN1I0pNBwgHmBZou/V4APBUbNiDJZCix5V4b1ABBgYvoHZqnEtGCiK4aB0HF1bk7oCeovebOvrmHRMUdrgKeNuYAycnrhMztOBxBMn5pf1KujnZ+ZLUOsALgrK9q5MK5AE7Jb1ysHzbcqZDI4Ad/cRZ7U0SomG+rDnUmZsBlonUFnFdVW7aJnLIBg6Hz0nYIwMDgdHp7Gg8230DQQqEPIzBlwKn3dXKT6YXPk0ibuRbLVvAScTJ8TZo9B0FFg5KAV+YygugMrWwaMkxomn89iRt+7Yoptg2B7igeAqT8FTASHgoFaGse2RiTMcgrd4/TDEgK6pKn+vtxnhEanW1hCcf42CN2lv/3y+BuyNazxJp1KCezjd2B9Pqsuo7/6jtQi3k5BzemZ8hWD0v9SkfqNgrW5XaMrxFJ4Rw53rcPzqioWp6LMdC9fGJiXcdvrm17RZecWuhQsqd8e9jnykVJjLL4if2gxog2ygE1TgsX8laBraXIj2PyJWr+SmDGk1mg=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(11063799006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P/LE0TdogRtI6YfBeSu2qbYaq4OiM7eZApAjyGJkgROBUsfS5FgZgD+fdBRhdayxDArJ1jkIGflkh7bcQim46Wm2fQQDl1/rl/O2ww0gi38AeVjg/XVysoPyMV+PGjQzN1De9Uoe21jXl0gOSGeN5uvPPj28y3AswdCjlYE1lCWpu0eASyCMNrtrDwALlCw2yDCGI21w9iGZ1JJvIZi/cOXwY0q0KySCOHSs1e6eNutdYlC0VDFCzbgqYyBHYT/a0wYVBKcX964UMJbyEr2mQlStyfGt5fj6Q/otgGW26M48JkAMxzOvXzNCZ2Fb3tlYcLdNI4AixMySG7iS/r9l8HP/Gxwzt2FjEZNHxpIec6m6e6K0mCCg3K4Cz0IAFFymWSHbPAbBkiJ2+9C15Mc/1Sdk785XvqNNcoeJViE+WnNEhSKKkETdrtoYT8GJPbAc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:31:49.0879 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cccbe4-f540-48bc-ebe9-08deb5c42039
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6427
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] Enable Arm SMC watchdog for STM32MP1
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
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,ozlabs.org:url,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 574815826A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the supports for Arm SMC watchdog for STM32MP1x
platforms. This enables the required config flags for both STM32MP13
and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
in SCMI configuration.

This series also requires a patch from Patrice[1] increasing the
CONFIG_SYS_MALLOC_F_LEN for STM32MP15.

[1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518-master-v1-1-37fd4df56609@foss.st.com/

Changes in v2:
- Improve patch 2 commit message
- Add Reviewed-by tags from Patrice for patches 1 & 3

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
