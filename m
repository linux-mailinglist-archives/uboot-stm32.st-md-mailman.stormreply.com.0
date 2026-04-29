Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MVsNevL8WlOkgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:14:19 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42004491A58
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 11:14:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D082EC87EDB;
	Wed, 29 Apr 2026 09:14:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F1D6C58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 09:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiiZb2qoi0WeHsCjhs5mAti+mIB5pYRfXETloE0XW9U5WrZNGLdirWZ1cQxRcgZF4E5cFaoobVAMwSNaI/s0tukaOJ2UN/9hgu0/ncui7WpdlwP9T9MMmoXUbzDuO2MdCeb/eETHLm8/cNUKekrLfSJNTSHt8ah6srL/PKF73luV2B7KatTP1WTTUnJPZzbF531K1Ef0GF7iMPqIs4oVlvlK2aNDkZwoPspa+H/mryQor/3tXluF64EPpO5XOWg6mkQq6u2/lee02cjEQhnQTIjNT2dCheOIX4nDhhBek5IGpLfxchcYgMwKdoRuk5h7oTkeQGAQGMIjjMKym1u33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZyRolrfTYn/6H6tb4rV1IaIYgsqoJnvK3brEoMHRR0=;
 b=qiC4JUFYDcoi7WG0q01GljRD78vgdOaJYbajSFuOc6j0f5z5WQRSM6PohcMte/51brZbtHv8zStNd+E+UyLc5zefBQQneGh90wyFp22GC6EZyJXYfklx/cD5b3yG1g/18i+QDlf+y37a+e4kD93AsYXvrUh7H05+EVSEtqYWQSepUi9cPJk19nt9imbgeIq9T0dkQcms563zhEJ1k6X3rDKlpS8BdiUzoWruEQudbBR+TRDEdqg2i35dtfgqfNcGTliiqPGxMgYxlp4C5aRCeOXrTg/d76kNYYv8zrjtCVp9BX+pcAMbBU9N+Q6zdX9lX6IR6cScGn+QMX2May8dJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZyRolrfTYn/6H6tb4rV1IaIYgsqoJnvK3brEoMHRR0=;
 b=SJ6d1Zh8HE0P5b7+lyEyxmFj06CF85vXjYPgtJLQFQpWov5APC3MFmilckRpyGYxouSO482GjeKCNT60IUoMWQXC2edHjnND4SGGZEYU7Se2tPo6cCmxSWGdK+Fn4tmckyQ7UMfbCK6hmkPJ89+MR5vtR4OBZLJ/PlSnn5oPzbOX2NdM6mJSCCpb7o+ACrp1YQyMvb+X/Oy/1F4gLd3kSfcSL80nLPbC5Swlyt+D86yvG/RP7hcwC66WH/A9RYLmvUGv4woUjCiIRsFPEw+j973LChRTKvYi999HpjTbW9hBvmjMptfLQ3s5pP6i3aBErzetoqq7mzHJlIAuOuRA9A==
Received: from AS4P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::10)
 by AS8PR10MB6338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:53e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:14:11 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::96) by AS4P251CA0018.outlook.office365.com
 (2603:10a6:20b:5d3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 09:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 09:14:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 11:17:23 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 11:14:10 +0200
Message-ID: <825d39e8-286d-4f83-a23e-0b798b1c9631@foss.st.com>
Date: Wed, 29 Apr 2026 11:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260426154724.2042569-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260426154724.2042569-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AS8PR10MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: ca22aa36-b7cc-42d6-f0b6-08dea5cfad2e
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Pt/WH6+nvdQWWKpaDV8Xt01qwwq3N2EjI4TAzazKiZKAYNbdtgfdN9AxQRvkfZb/imBCRnOPLweO/VSaitYX3Bsri0dgd2RFbcAiLQqh4TBR0GGbKKF6Y0dab50eyOjOWQvfo57BankT9JY0QNv2K+FxQbrbI8uONs7Q840UWM7lAd5lJKss7OuoOCBhlLafj+AALkXiPJfDc7LjzOYxq3wXnmvBeom2H7a80R8WBLMQSE4rpYMB2LUAOCmV81sM9ndS95WZwOBA4QrR0N8kMS7Dc7yxpRHW62WpWnoSSaU0pKCAErB99hISJ6MZSiTLiWy8utofxf9u6bthX+HCdjXPRJbXpPV3C1yqg6+aZndzzAaYSy7G23fgyiSd8egYk1sYc6hD7qyM0ybeJpb1Ri8/l8MwG66TgF0uIkIMX5aLynXFByC+/BUsWgb+fta6KA6PgP2ZAgK6qeVoVLpnEvJaHvfxPxZJ/0rgurwWItokl1R+6MQQk4Wmc1SlSsqj4vtPqs1zvViyQ0KYQOWZentpfO9Qj/eTW64esxnvZmW2D0ptqHNNHU4raIslvzCyUhzeMb17PMpBxWoWT0A8xf6QbP9oWlskAoJ9MKCqMZqsKKlwY3X/jeWuD0WnL0zdKfcNChgtkfRsy5d9EejsRLgA22l9mSLJ9sT6rVkOBdK9SF3jC0LERA3L3PvjkSXHSS2uc94ZDqw0ht+nNAOmSFjej4fbLZIYmLLJ8vS33JY=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UsSRz6wz+7CPETsfVwapbhTWf8IcGpe5ThNjlAvY+KvGIbPbpOm0kXOLUYEIfn9KvGgWAzwTkoTqCqHrb413le5c0hJWDr/ayY3FFeU3nWgU2/hbTItumLZ/o1as3Mu4FxZT0YJWuyNBF7oX/xjEjrmpcptkIvhoiijut93R6Hc/8VQXvPCvJsUYwSQMI/amyFRSKeQTQnjCqjPAzn9vyql/l53CYhukjoMtSknPx/TjC5wt7pRycwZZwcgaLU/wQC3w9gLORn1qwP6rAF02tFex/3IlCc3k77YBQvPpqLoryhu7vvoUOaoQbpjOpKhmzlCgMoNOv25sKrO8URx4fY18ioJpC4uC1aYGDHkEE/978kFQ8i58qrinhGs98gfzJzXb5X2OR8cZSziHSN91645tkVsR/u57zJSHEDHGpj2Q7+G6LY4eTMq4Aspa97rj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:14:11.4715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca22aa36-b7cc-42d6-f0b6-08dea5cfad2e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6338
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Jerome Forissier <jerome.forissier@arm.com>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Rasmus Villemoes <ravi@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jonathan GUILLOT <jonathan@joggee.fr>, Javier
 Martinez Canillas <javierm@redhat.com>, Sughosh
 Ganu <sughosh.ganu@arm.com>, Padmarao
 Begari <padmarao.begari@amd.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 linux-amarula@amarulasolutions.com, Simon Glass <sjg@chromium.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>
Subject: Re: [Uboot-stm32] [PATCH v7 0/8] Support metadata-driven A/B boot
	for STM32MP25
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
X-Rspamd-Queue-Id: 42004491A58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:vincent.stehle@arm.com,m:jerome.forissier@arm.com,m:trini@konsulko.com,m:mkorpershoek@kernel.org,m:xypron.glpk@gmx.de,m:ravi@prevas.dk,m:ilias.apalodimas@linaro.org,m:jonathan@joggee.fr,m:javierm@redhat.com,m:sughosh.ganu@arm.com,m:padmarao.begari@amd.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:michal.simek@amd.com,m:quentin.schulz@cherry.de,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:linux-amarula@amarulasolutions.com,m:sjg@chromium.org,m:dinesh.maniyam@altera.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,mailbox.org,arm.com,konsulko.com,kernel.org,gmx.de,prevas.dk,linaro.org,joggee.fr,redhat.com,amd.com,st-md-mailman.stormreply.com,cherry.de,foss.st.com,gmail.com,amarulasolutions.com,chromium.org,altera.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.993];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/26/26 17:46, Dario Binacchi wrote:
> This series, the mainline version of [1], provides the necessary changes
> in U-Boot to support the metadata-driven A/B update flow for STM32MP25
> boards. It implements the logic required to dynamically select the boot
> bank based on FWU metadata.
> 
> These changes are designed to be backward compatible while providing
> the necessary infrastructure for the A/B scheme.
> 
> The series has been tested on the STM32MP257F-EV1 board.
> 
> Additionally, some patches in the series propose changes with
> general-purpose utility:
> 
>  1/7 lib: uuid: add partition type GUID for extended bootloader
>  4/7 cmd: part: support lookup by UUID in 'part number'
>  6/7 fwu: add helper to get image GUID by type and bank index
> 
> [1] https://github.com/STMicroelectronics/u-boot/pull/6
> 
> Changes in v7:
> - Add Reviewed-by of Simon Glass for patc 7/8 of "test: dm:
>   fwu_mdata: add test for fwu_mdata_get_image_guid".
> 
> Changes in v6:
> - Add Reviewed-by of Simon Glass to patch 3/8 "test: cmd: add unit
>   tests for part command"
> 
> Changes in v5:
> - Update doc/usage/cmd/part.rst to reflect the changes related to the
>   part command.
> - Add Acked-by of Ilias Apalodimas to patch 6/8 "fwu: add helper to get
>   image GUID by type and bank index"
> 
> Changes in v4:
> - Place the part command tests in the cmd suite rather than the dm
>   suite.
> - Order the include files according the U-Boot coding style.
> - Add patch 7/8 test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
> 
> Changes in v3:
> - Wrap lines exceeding 80 columns in test/cmd/part.c file.
> - Combine run_command() and ut_asserteq() -> ut_asserteq(1, run_command(
> - Add kerneldoc comment for fwu_mdata_get_image_guid() above its declaration
>   in fwu.h.
> - Add log_warning() messages to fwu_platform_hook() to catch inconsistent
>   FWU metadata (boot GUID found but root GUID missing or viceversa), as
>   suggested by Simon Glass.
> 
> Changes in v2:
> - Add links to the XBOOTLDR specification in the commit message of patch
>    1/7 lib: uuid: add partition type GUID for extended bootloader.
> - Update help for 'part start', 'part size' to mention UUID.
> - Add kerneldoc comment for fwu_mdata_get_image_guid().
> - Pass efi_guid_t by pointer in fwu_mdata_get_image_guid().
> - Add patches:
>    5/7 test: cmd: part: add UUID lookup tests
>    3/7 test: cmd: add unit tests for part command
>    2/7 test: dm: part: add test for part_get_info_by_uuid
> 
> Dario Binacchi (8):
>   lib: uuid: add partition type GUID for extended bootloader
>   test: dm: part: add test for part_get_info_by_uuid
>   test: cmd: add unit tests for part command
>   cmd: part: support lookup by UUID
>   test: cmd: part: add UUID lookup tests
>   fwu: add helper to get image GUID by type and bank index
>   test: dm: fwu_mdata: add test for fwu_mdata_get_image_guid
>   board: st: stm32mp25: support dynamic A/B bank bootup
> 
>  board/st/stm32mp2/stm32mp2.c          |  32 ++++
>  cmd/part.c                            |  12 +-
>  doc/README.gpt                        |   2 +
>  doc/usage/cmd/part.rst                |   6 +-
>  include/configs/stm32mp25_st_common.h |  15 ++
>  include/fwu.h                         |  11 ++
>  include/part_efi.h                    |   3 +
>  lib/fwu_updates/fwu.c                 |  33 ++++
>  lib/uuid.c                            |   1 +
>  test/cmd/Makefile                     |   1 +
>  test/cmd/part.c                       | 209 ++++++++++++++++++++++++++
>  test/dm/fwu_mdata.c                   |  48 ++++++
>  test/dm/part.c                        |  53 +++++++
>  13 files changed, 419 insertions(+), 7 deletions(-)
>  create mode 100644 test/cmd/part.c
> 



Hi Dario

I am preparing a pull request for STM32 including this series.
Unfortunately, there is an error linked to tests test/cmd/part.c 

You can use my temporary pull request tag u-boot-stm32-20260429

You will find the error logs here encountered with qemu test : https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/29932

Thanks
Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
