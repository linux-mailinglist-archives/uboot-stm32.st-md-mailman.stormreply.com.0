Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEppMXP+8mkfwgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:02:11 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6B49E527
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:02:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C02CC8F262;
	Thu, 30 Apr 2026 07:02:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64E42C87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 07:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNuOMuayTr4xbZyt36VhtznfIJjlQ1mzmbToZi7RsG0niO+ABKruDhBGk2bGC1G7UbZFhTEv/IbkhUx/VBbIyMdT/R77e6blkXqA/CNN2R7T9FnpyWa7jiAJslOIZ0kayGSr+r9GQ6hh68n98Zz8+kaZyAjWgIJMLySr/oXBjW81MSR4LRylKYLbpzTxy8ns99ETIzlj1bA/wUVeZ6egnDqCnviAnplVTfEzZMhb6bDqNXaF2jqbMyT1Qqa2vyUjOFd0AhQkqnhCmxZBewoSUxsM5ASbPBy9GdhtTZeh8QvcK8oserB3oWmPX5swhh2QuqrfKWDXpiLLkzD8IKnzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce4PuUp8lCOYIFPbJDPovWB0lzqRo4fUFK/+OambwBo=;
 b=rR56o45MG3RiKtM0ErQr2hix14d/Ji8W1MPhmHYQzh6S68fjSxsEU2ZpnwVJn0rdiUwQ8+lDyueIvfq4EjQkKzdTMSq3KMvSIetn2TqaJjzgSoxN+5d+wTDXy/1/wPhWXYr04KMUZT7q2IpAOdS8SSLWXfJ2siE1PShwuAMwbL9Dce6M+/9iwwhuU9a1zFUkgI2iBwqjcu786KGuvKATEF8RdVWsSjn0RzAMf7rmavda2jbeTfaOCfqN1edz8oMi9d/4ZddXhiNRHGqxggNyZVet6O0zPP+sYntp8hm7GN05DP3zV6ZrvfgmDzNGM29N7Mc3H/1MFhBXkwl75/Ry4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce4PuUp8lCOYIFPbJDPovWB0lzqRo4fUFK/+OambwBo=;
 b=GZjiwNrmYdAB4jlvTbkdR94+97DOp4CqswyYvw9jTBLiNh5u+xCGaygab2RpaRQJXRU+4e6jTOGF/zUbH309yciTTXBAzCcGeUNr7mTQ15j5EkN4z0t+kWR1fu1PxDfVAgA3f7smIMps5VqDsm/FPSSHbuHrlg9yHEfuCdiWzhRgEXrT82yE0HpoMXwaxnXx802lMoqKiF4IVibNLjs13DvmMdg9/0jb3jB10YU0edfUqSxoK3wyK6p5EwiXp5DnAZvBsFaaDeFaE5K2pYqTf9dTaIXCOQt0uyFxiYYjfuD4xN+o3zOSUr5EhWfmASD805EVS6XLEDWoc8faKX6xHw==
Received: from DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:02:06 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::52) by DUZPR01CA0154.outlook.office365.com
 (2603:10a6:10:4bd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:02:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:05:38 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:02:04 +0200
Message-ID: <abfe9af0-a694-44ab-a850-d3fe614235f5@foss.st.com>
Date: Thu, 30 Apr 2026 09:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|DB8PR10MB3529:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdc56d4-bea8-4cf9-df38-08dea6866383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: UkNuO7n3SoES7EuYTZHV2Jgx8o2JMvhYBh6mY1EhQaF39+iV0Gw5lFuyWBQo9ejgkCMh/sm+iKiu0L8AXzLP0zAtvAlIX5+r13NBREXadkuPwa7fvDa3LYqOkS8eBgmOEAjVuV47fG+cPr6h3eM0jAXr4MCcyEmCEKqhQ4Jj6Yy5xHeFBLldTzPuWOCwpdnFUfhP7gI7aXWfKPVKPGwPLN2DGswgfBVM17BAjdPEMI1szRQU3k8j6PSCb/D45DBvMlKp0FgndQy0HT9HxCegHl5H5z7oOfMT8IbGTNyW6J4Hq1/A20dZqBrk1Y2oUcN5igED4Qy99+6K+tPcq5Ro8wnuPzEtm04ARE2KGKYL/2fW50biiGB4gnDhtfwhMoqPBDN0zk+jYZHI+EJa/kUAsY9cMY/Kx1deE1cjFUTx9hSOB32t/NuKp2iGb6kjDbQsPnxV9kdKQjtiT/oIu1TtPeM7EYnCL9fnFOckk9pkdCmU1IeiyqKEVxiz/+eqdLrkghbaR+pxxgHPopabsOvr/qQiYd7u/MykGgd2I4+NNFlok0BYjzjLK2PatnNiOrlVIEIFC9AECdZBNoTHKUwBscudt9ivdR4KfPXCvuWnx/N50EuW1HQ+pzvxc+izYngIFz+DVbs5C03wapdE6zELv5oWdGmKfKsvz2MGJdl7nqKXz6U7ByH8lTWfve/P57CVCbyQJehLgqiRz5AlfX3lE1ynmgwVC4BOVyzE0pctZSBv9fOGnKDRGCD8CB3Mtqn/hncyandnV9btwnJXzdbeTA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7PN2ZVBIt4UaB+fHwyzdI0Rcc/+CI/Dz6+KOVj47pKWPskpPHGX+Q9hTvdfxS7RQWct0rLt5Wch4bbhm7by1VdcbK/hviBGRlfoU5Mev8PjhO0jxCGL+ctQ0GR+GWVxSL5ef1WJdUbqJFYoYTJ8toVkN9Zdf3oCjJCN0ZVAncVI8XcJXDRLcIfRgJ8/BcFnkeQNjVQBJclSkSvTKyyN/FLxpnkQjvmUMLSC5yYsQqPxrGgHtuERcPqD4EGo9JZv8iUEEZx0kOSwCo1SNZsZQGryfWm12YCdFL94hEYzSixeYSKRZyf3ISqS5UxLE1UQMTtKnYawICDcL3zMfhpIh++EH4d6tcP0yLmCBe0sOKIhKkOhA5WQ/e9SIQ1wBKDbZgHCCDfmFkXuQ3u5PDMSdnGbyQY57i6okAmNf0gW98Sx1hOWfAaJNezHkWWnFPDVi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:02:05.7450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdc56d4-bea8-4cf9-df38-08dea6866383
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3529
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon
 Glass <sjg@chromium.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Simon Glass <simon.glass@canonical.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dragan Simic <dsimic@manjaro.org>, Christian Marangi <ansuelsmth@gmail.com>,
 Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Ion Agorria <ion@agorria.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/9] video: support Rocktech
	RK050HR345-CT106A panel
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
X-Rspamd-Queue-Id: 66F6B49E527
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
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:xypron.glpk@gmx.de,m:sjg@chromium.org,m:clamor95@gmail.com,m:simon.glass@canonical.com,m:andrew.goodbody@linaro.org,m:dsimic@manjaro.org,m:ansuelsmth@gmail.com,m:alpernebiyasak@gmail.com,m:agraf@csgraf.de,m:ion@agorria.com,m:miquel.raynal@bootlin.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,m:ag.dev.uboot@gmail.com,m:jagan@amarulasolutions.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,st-md-mailman.stormreply.com,gmx.de,chromium.org,gmail.com,canonical.com,linaro.org,manjaro.org,csgraf.de,agorria.com,bootlin.com,foss.st.com,amarulasolutions.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.995];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]



On 2/25/26 17:16, Dario Binacchi wrote:
> This series adds support for the Rocktech RK050HR345-CT106A panel.
> The initialization of this panel requires a 9-bit word length
> configuration. To support this, I have extended the STM32 SPI driver
> (including support for the STM32MP25 SoC) to implement the set_wordlen
> operation.
> 
> To properly validate these changes and ensure the SPI uclass correctly
> handles the word length propagation, I have also implemented the
> corresponding logic in the sandbox driver and added a dedicated unit
> test.
> 
> I have grouped these patches together to provide a complete overview of
> the implementation and its verification.
> 
> Changes in v3:
> - Use struct spi_slave data to access wordlen parameter instead
>   of driver private data.
> - Move the stm32_spi_is_enabled() helper to the new patch
>   "spi: stm32: add stm32_spi_is_enabled() helper"
> - Insert blank lines to separate code in ilitek-ili9806e.c
> 
> Changes in v2:
> - Rplace tristate with bool in drivers/video/Kconfig
> 
> Dario Binacchi (9):
>   spi: add support for bits-per-word setting
>   spi: sandbox_spi: support wordlen setup
>   test: spi: add sandbox_spi_get_wordlen interface
>   test: dm: spi: add testcase for spi_set_wordlen()
>   spi: stm32: clean up buffer length assignment
>   spi: stm32: add stm32_spi_is_enabled() helper
>   spi: stm32: add support for bits-per-word setting
>   spi: stm32: extend support to STM32MP25
>   video: support Rocktech RK050HR345-CT106A panel
> 
>  arch/sandbox/include/asm/test.h |   8 +
>  drivers/spi/sandbox_spi.c       |  17 ++
>  drivers/spi/spi-uclass.c        |  22 +-
>  drivers/spi/stm32_spi.c         |  71 ++++++-
>  drivers/video/Kconfig           |   8 +
>  drivers/video/Makefile          |   1 +
>  drivers/video/ilitek-ili9806e.c | 356 ++++++++++++++++++++++++++++++++
>  include/spi.h                   |  14 ++
>  test/dm/spi.c                   |  16 ++
>  9 files changed, 502 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/video/ilitek-ili9806e.c
> 
For the whole series

Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
