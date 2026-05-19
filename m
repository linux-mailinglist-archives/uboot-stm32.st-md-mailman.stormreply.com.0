Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bF1vEVsaDGpJWQUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:55 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B2579ACF
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B3EC8F294;
	Tue, 19 May 2026 08:07:53 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C90CC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 08:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY4KJFPMol9rJwrjBUtS9s8vqU9WIiN0tVd+l8ae8lseEU7KyYgjuOlS09GIfrg0QKKcR9g/XFTNMrLDSINEuxHFjsoX0BnEYJdGHCInMOrptLZyp3dlBCBl414GB2P9pIlExEF8QrjE67xr8PStk96Cu0z65kJWtE9F7Sb70SKz0nOR/zVo7hoUPd0kUp9Gqdxx4WRMsfzpMtivvjxKKgtmFz96ra6JeThJafDAJ5uT3VW3hubfvSgOSSpKNDWRAX+VMoBgvlu7Tt36HDrhCR/Xka3s6KSNZmLWLeXRXdEa+Uq7mu7iZnJU/SeP1pJi6/vIW6rLDpa60Huwhig+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwWMu76H6ng6TK6yt5p918GJ5+WiHOMPeN3PYUHxPZ8=;
 b=CPN/HGkuUuVq+Fj4JHq3RQUdqw0dcyaNwkvc9PEjSAReiCW2jTplcBsrN1WHzVNuIk40P18fQ5ZuaBrw0ApBM5e0tS94wQtihj1AvVJT4zPMu/6eVJ0vQW524bvFEjLkzYhRTDqM9bPv4s6ckOGi+7DVbWv7qXzbCR0FtoSS8wmUQ0N6SoEeZtvGZKR1tNAqzUHVnu5trSTjqnIS3Ibd0wUIk5UifPm2anJJCbbbJUv2EXWxWB4BTGck7BRAgFT2zdhgGoYsWmfzKS68oWq2c8pNMmX1Nemu9KE/JiOuQpRhRI6ul2Hc4cFbSNJjrpH+sKyLvOK7AcstHmyf3M9dwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwWMu76H6ng6TK6yt5p918GJ5+WiHOMPeN3PYUHxPZ8=;
 b=O0lCH+8ai3r2xEu5D7IrPWiJvP0C3T1BkrAdA+jEodsqXjz5cgSSyjxC9oItB9PXwbrYVSonbhyIKIg1TrQw5RpIHhxSYbJbf6DGfX+HQFQIb4J4fNsfuTfBR3090/VSF8PP2BKW4lp1kgCPnebtRY5zR4bsdnaOcOal4knYiyzMYnF2phOp8phxRxm9wXWBYbDmoSLmGRRM/wto6CEyAGfUCDb08XAEdxijcb4a7uVy+4b7MUJRtmCkNv5M2hQxzc8BsFtgQXkfxuMr+gKreLgTs6DI80VHpK4gUNwzb1bhMA7JsLIfgmAZvmPiqD/GPZ0ubmwyeCD63GYIoksLfw==
Received: from DB3PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:8:1::19) by
 DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Tue, 19 May 2026 08:07:45 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com (2603:10a6:8:1::4) by
 DB3PR06CA0006.outlook.office365.com (2603:10a6:8:1::19) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via
 Frontend Transport; Tue, 19 May 2026 08:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:07:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:11:13 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:07:44 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 10:07:35 +0200
Message-ID: <20260519080737.47928-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080737.47928-1-yann.gautier@foss.st.com>
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|DU0PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cc95a8-a735-40bb-fc48-08deb57db553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: xE2thtSU4nTsa+EeMpH1w2fYN9GKK/tqYAe81trj6SG+cfwa+2CIY7LmvhmtWJmSOtUSqkJIYZbi1wwBLG2GkqF9U6SXtMCGCBRz7sN7vGKYzb/qPOw5EbZc1nQ4hXkg8l0d4bVVYRp28wi0bn4RhZfoA5z0WXtdzmJWOE/iuugq2IOJtFBlNn6i5+0XPxSr/f+OT4aAhKnvKbkZHHXWPAAV0lKEba4bJ8j38wZ6DKt2KOi7T1KsT7eQNabejKxAtNchdR3prZpcvMDFOZHs6JH9iVS7w64d0+Y+QUXtD3hhcdV4h/URsSy6oC5PHHlnvlCqSgdAL57JJxMKNxel0tilJYL8VvUHEbofNclRp1YElQFIK4g1uUyoJwFYQIl9YXFb2GmRzLgc0X5tP0l4Su8z9mM+isXwSctb4sNNqn4XitBwDV6ElMPLhxjdma9eaIX+nXkZSOLenmmGjPyAp6AAZCXM3A95pjzDI7clr0cjgcHI/A+mFrENBQ310WCVo9aeevWYzxVbPj9F1tn3wQpJltW4it7pTp+M0+Bs+6IrOY2jhyUHwDwQV9uGvbTB29LbSEz0zkBbyVHd16953P7qmjjPNGSu3d02BxSRkyZZx4GS8McKNCUQkY3nxWIZvMNlL3y+2a9iDhj50PeuzPoc7YZplF2KL1hDtnhYUhI4hqjmjhlR1T3c6gi/k2zMN1eiXWLLZ5jZnlQ1gUyuGEr4fYBgGvHCt1lU3kQ0CfY=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yXqfYZpDovyr7kKYY1O00b6VyeNpmLxfAcie9QoUfzQHsFx/PWGqyk7EQzRRdzB2Jysl55QLBPNfLleB3lY2bX6bQ1lHsZfHNkVI7kzIetUDhFJYcXHDjbBOKvODSMh8PR9cuxmiXAnPh/g7wKzIH7boQ+HCxuDVpKXh8fQXO6OqfrIzft7FHDXRZHk4u6i0E29twESxZLUX42iuzTW/Un249bhzliDPJtDMvG8ySt9AVbet0DgXuaweP5bj0hbxAhImPqFaMSv0gTWopWGwHdG84Pc67YiAeFy94Nrj/xl6zB7jLmfbbzThijcZ13IoBCrNSV4/wtWr7LpaI9hgAnEj7OzSQ/J1O4NxCjzyb6teM4cWllTKZuIlzyL2gugzoxPHrxMI/lRXSkiG0Em2wTPQmiJ2XPGQ+7mp91p57gIpwIvXlPjcfAIGuOnW9yjV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:07:44.9821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cc95a8-a735-40bb-fc48-08deb57db553
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] configs: stm32: enable WDT_ARM_SMC driver
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
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
X-Rspamd-Queue-Id: 036B2579ACF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lionel Debieve <lionel.debieve@foss.st.com>

Enable the arm watchdog over SMC driver.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

---

 configs/stm32mp15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index b9e44254087a..2ee08dc15551 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -169,5 +169,6 @@ CONFIG_BMP_24BPP=y
 CONFIG_BMP_32BPP=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
+CONFIG_WDT_ARM_SMC=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
