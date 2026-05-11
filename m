Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B8xIwtxAWoyZgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 08:02:51 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5735085FB
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 08:02:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D286AC8F274;
	Mon, 11 May 2026 06:02:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6F52C87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 06:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaOhx7Y2puIYoFJh8pwceE3hT+Aj+RAymCRpnP56BCG992TSMpqMxv239Qm1kjy+GdFtFeLLNqT+LUjXfjiaZOrMcrTaQzrq1u4D+YL/IlMU/+T2IDbUXvR9OmDKiz22SZ6JuJ1YSUn5ViF4dYd04gPLwWyeWsFhtZFm6a19loIvbQxDfxOG/BCz58WzT4bqgzYbZK0vGVuCIPws3MSwjuyO6WKO8UgfInU2eRpDnUmt3RtfuY0sn7nJ4u6sPpKEkoqDQkDQSUXvj0J69cGIgctQfFl6o3+JQiw9wPox3VXdCUwARjQjzMKZMBoS4vRv29wrHXhKSZ9fkHa5stHbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4yQlLdWAPL7D/PUAC6qqJTIXKIp4fuLS8YZAULtTeU=;
 b=ofsZFjclPxR2EXMGvCCanWdbWRtm5u1QrDKcyvTVAj842lpb3YkC5k6dm029HFJVEIHp/OJBo1u8d76n1RE7AtG0or9KpO3ef8Hcs/fZj1MP3p7nF7wfcTntzspIVWYzbJ5o8GbBDUcK+tkbs2Ts6vBblTItprrtb1/N7Pwt/PAkGWcY/OabKMJkneulUt3V95W+qn3A1L/UiQIFj+uDO7JYod20VHu+2xWsoxjGzOfbr41nOWHNDUHHWyfKNFUNX1QCvGuMKggzCrpahtyUPUlLDkQc8XDuee2IJ0MQ4Z1QHg2UTw5G/UcqE1T7TEB29uq1z7tPVo4fxxhW/qTIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4yQlLdWAPL7D/PUAC6qqJTIXKIp4fuLS8YZAULtTeU=;
 b=Q1j75RrJwl4j1pVDc/TgPB2rh+kAB2xkuOuaRmd7v6rSPpbi9kfN/7/GWoL9Xv9GhjQJEMfnRKIXEmUZwx6tmhtvQZcTVfscqIkUxeLhEr14OsaCg5jmtOWsCdTz6ObmOQ8Pq6JZbEWbbYJv4KhFxiNZP1EU96fHSP4lhLDxs9Iarfka2eIZRxEy34B3y2dpovvHpYdhkzZssg1sSRjD6rhgsenmx1+6h/oma1KhEWLzKf8g1uvKzKjWtdjYLzmxL1jAGMZfHl7954/9KTS5vpeHlKszG7vsomtZ/SdRHnDYy31hDJehcH3426VjWRbwTvYENZsasUuU+yxa9FaV/g==
Received: from DUZPR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::19) by AM7PR10MB3921.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:17a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:02:47 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::bb) by DUZPR01CA0011.outlook.office365.com
 (2603:10a6:10:3c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Mon, 11 May 2026 06:02:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 08:06:12 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 08:02:46 +0200
Message-ID: <2afe2bd8-f963-44b8-8dae-107b4cb34b8a@foss.st.com>
Date: Mon, 11 May 2026 08:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, <u-boot@lists.denx.de>
References: <20260510171723.56866-1-marek.vasut+renesas@mailbox.org>
 <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C3:EE_|AM7PR10MB3921:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab72b77-04c7-40d1-1ce9-08deaf22ed1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ZhdQ7wpk20hLcnYni/fAJ0KTKsLiAJFy11652DLWkXxl3I1k76O8Us0Na3y/OSeN8ZhQJCnAdwfIpdeS8PRtff52aEHLqzg68U0TjnAa9yy66OFJ71DtnFhfbHt/OdWcbLoe7D+eICqh/G6AiOZNIYJBRNG3t5qaY/ElyVk1RkPmqkEScm/0YzzfCXxBrf7Etan56UZuP+vngygNFyHpBjTL4bZpfdWIj7eXNjtM+earSEVu2wcIYvpqPHHIzF4o5hZeW3bD1hxWgHSnMOYqsI93uWr5+ECg6aTqg3P7iNvYgXbQ7HftmiuUJBt6HNhkEnyfX0QUnLNb9ir8YzqGGrlboccZfoit6UQAhiDrL1jAyFT0RiAG6bMk5RICwShddPZ6MCPP0V66uwrZGxenXt8poFo9hIPcgycWNVf2punXFNe//H2htdXXcJrWebdVgSVE91P+re1VYV9uQ33BFUjLHyDChygKhyu450V4Onq690+5v9vhuiIWN9tJZkvJS8iG+ZsnXaiDG/dGUOLqo0l9CL3n8uilRERvFQmSvNIxPI4U/EEIabChxpeIQQKGEfH8NGWL+YBwHXIoe20TZFGm25wwNI6eIbD0Jy2cZOAgZZ2SGVJhfUGDH5JNai2Ov52uxZOK7VykzEhExtKW6ud6BFDhilwkbszK3yoZMyakiXydUnRPFB9gyDGcuD0sPDSJv7aI5eo06+yPXag1VQuhN2D8HjRdFrR9fSXW7+g=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nJ3Sf044/y8JHCmFgchuVRhVwCbJzBJzbPScjXINZl5Wtzod7BPYRL9ZXBmqNK0qr5K883HifcFJtCCJYgFYMHUXo6w1EKGr3qgwP+9xEwBxw3+dzwsgkRhwNsabqTWUlss11o6PyCAH97Oqcjn6tEloeC7wi+0wfJAh4Tg5387UHSbE7IVjwfT8n+3vZK+FwasmUNBrbvJ1ZA9+bjln/2hG5qeXYMvzX5+fnKRL38O+TxwmnjO97DQgyojiiU+s6awpWkh9TH7soc71S5UXKI4Un/JAPrPNYJa7vAINxYHsSlygwbgVrv5PYC5w5QpcBpY+UawCbyiTXyYBSEl1tBePXyDU+ssEZUIIWQS11ZObx7BGK+2QIi5O1GobDuMZjtpLcGw03mT+0w5FqahjzShzDJZVZ0XZqxY8vUQ38nSKqLBo4m/2AA2ng9A0sv+X
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:02:47.3978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab72b77-04c7-40d1-1ce9-08deaf22ed1d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3921
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] video: stm32: Staticize and
	constify driver ops
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
X-Rspamd-Queue-Id: 2B5735085FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:ag.dev.uboot@gmail.com,m:marek.vasut@mailbox.org,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,st.com:email,denx.de:email,konsulko.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,konsulko.com,st-md-mailman.stormreply.com,gmail.com];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/10/26 19:17, Marek Vasut wrote:
> Set the ops structure as static const. The structure is not accessible
> from outside of this driver and is not going to be modified at runtime.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Anatolij Gustschin <ag.dev.uboot@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/video/stm32/stm32_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
> index 5c4d8d2aab5..29c57a4ff89 100644
> --- a/drivers/video/stm32/stm32_dsi.c
> +++ b/drivers/video/stm32/stm32_dsi.c
> @@ -511,7 +511,7 @@ err_reg:
>  	return ret;
>  }
>  
> -struct video_bridge_ops stm32_dsi_ops = {
> +static const struct video_bridge_ops stm32_dsi_ops = {
>  	.attach = stm32_dsi_attach,
>  	.set_backlight = stm32_dsi_set_backlight,
>  };

Hi Marek

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
