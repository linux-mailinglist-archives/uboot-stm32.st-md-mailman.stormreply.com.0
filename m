Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wByIOzbGnmkuXQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 10:51:51 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F0195516
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 10:51:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7CA5C8F284;
	Wed, 25 Feb 2026 09:51:49 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD6E9C8F281
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 09:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQKFoGZ22mMWc34fmk9hbYwPT8x9masRtyz+RAkN+9Cj7ILsmTY6q83c68WabQcKzPQ2mGDR1rzUxeL+iv21lQQOp76wHkuWwJ0dCVyCk0WACwQSQPocuvHQflVFzVBEzTJMdcqtSmvfusBymKkFwDJnrGPEeBHomXbXsgpBjwNTl6odzJyfgDO/NxYMXnhlkCMFWFoyW1sKuaxXFyJqODUwRtDqrh0aM9124OqCUfbafYd226pW/avJ6fk9NjfSQxMphP0DPG1Fb9HDWJQbty0sSD/PGwhLrUF4dDjWtn4FqdG5fDFKp61JtbO2mavYepw0ggk7Bml2PiRHSJvvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8eoyHwT8/TNIRAZNG3Ud+fG/+x+mXsOj/vAnxcSmU4=;
 b=d2VmpTW8uft7B4LzWRfzZVH/tValZlk05yBjq443ctwY0SEBlMC22riqapeMdnRlLMuRxnC1ikrjJpFZk4uawQBue30QtbUeOEA82XBUHeghlHtDk+DNeOmiy8ftmhI7elzX24hH0QokUzjCqmhXG69hoL+gfs5e+IPm+S+14dT9gN6oIVYYkYWCPQ/7RY+Kfj8Ql74OtED1QMRhx5PCXxCnOvDYUAWrNdsq9g9Ll3BpUw/OVr9uF72UkEKMLCuyRpX31FV5kcWq+Ny7Ayk4y0LhALKsHifMUbzE421Z0qyCZD8fVBk74baxHgOdTZGZKWV/C4KlL9lfo3FznYFauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8eoyHwT8/TNIRAZNG3Ud+fG/+x+mXsOj/vAnxcSmU4=;
 b=oOxtbWYs1JSrq4T3e2a6b5QMOekdsXJdCAafZgEJnY1wuINd9vCnHKTluq4MzzoCCuuSR8kOhyUzvLHoBlTHF0NEmEEru+NDnFD91wipCV7eASvYJ9Db5BwTO3GtJHTwnaeH16HIRY4rUowJTdL4jRZ/viec7ZUibwloqGkO1CShHQvXCG2na8RjOQGuSHrILnW8enjftPCjxjELEMWELT9Bf5ZIc/dciuPBZyf4kPJSuYYxqwSeCzPDdUeGcfsR8O10watOJdEuoSphH5Wli3i9aQn0YlH0lwmrGmRMWTDqY5f+8f5dSvL/ejyQ+F2iKDIxXJ9zNVjGjEiS4AY/0Q==
Received: from AM8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::7)
 by AS2PR10MB7575.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 09:51:46 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::82) by AM8P191CA0002.outlook.office365.com
 (2603:10a6:20b:21a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 09:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 09:51:45 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 10:53:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 10:51:44 +0100
Message-ID: <bc144e1f-deb6-4f38-b730-6923bcc6ad18@foss.st.com>
Date: Wed, 25 Feb 2026 10:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
 <20260221094252.3103034-6-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260221094252.3103034-6-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|AS2PR10MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b1a72f-8b6a-4335-f617-08de74537cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: /2Gtyno/doIjK9A7BHJTcf1J47blUgCT1yuTqhtP+EoBf+4b9eShCVLECDmkTZ4HMIkLppdySG2tfHqN8JM2/JCltNzRTJOiVMq6X+XOCGxun3YuroFOTvpfAdOl06e2EDZxg4/4A/quViM8fa3S4cxo88/Di+wPAbxIiykEca+oQNZEljdutssi5vM6pH+sX9WWUAHCRAMKckm6fy8Q4qsOdx5SO4Ku/ahtVseCrKsN8mqhpJGKh0D50mqPXyXhOjCtPzInJtoVrd8gtzFZzENTEZ9rJjbV4GkS92YqvknPI5DveKw1A5v0QZzi9rj/TOCCkZaK8J4UbfSmvQ4dBGAH21djB2H5Ks76LHvQJgvqBhshZAXzQeluG4Ajw8lOExLUMl7JPb6ycIx9FskXPl1em8RdYooXqKXbOor/PF/xLNlB6JDL+08oKshf3mXdWD5Cprxc27wkA7+6a0A8HjyRP6dHym/p+T9Op/XQon77QM+jzTWSRUP6WcQPdzzjphPOcjEYM/ReMzm9VmHiuTj6I3tVZzUgVkd3Gkef2vwmjFBWaIhMz0Z4lbwv4TZRA9IxVcBfxzYyvpQTiFUNB2CHP2l6biTHOvvQaoUXhCOMGI/mivI25OcnSQKljQif01SQ0Jibatb5VWeUhyjc6rmPzaaCTw0o3WlALhNE01ir8he8U+QPqc30oEwSNh+aI8TKHIxZtes0d48HsCQ98VWworoXjZWA0EYKk2KDaML/zmpX0zIR75zHRqZDp0sZDlGQbV8vZroS+wY7B9CjtlqAggnaU2qMMeFfrcxlt6AemIjquSS7BqoXoXZF6wq7y/p5lJh/+5GBeGulipV8ig==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FbxiRa6hV2b8Qg+bD50qcRrI2tl4suuyLI0IpM2X5NODIetFbmshbqAGhKhE/ighUdeOvPv1T35FjmoYdkB/EpW+ZTNjJcJxJo+vli+IlzhLty7AdAYKMdI/qVQlliNS0oZ9+IAqhr7hQe+as1Bx5n6H7MloWcPhqQcBys43U29rySgTyMLVcssrJKybOjsptjrnv05hU1UDrvXl59JKVQmFIQJXZtr6V1lSRxPsWBPlHt6783/XSScX/JzCvs8EdpAzkDH/U9qfDuh8hXbyfRQIgqekjMAuvo2/Uj0xlgXeAh0l7UFQ9xvzUGqnZv0RQRXp88413eOQouCDWCXIWDcjDKxX7SFniLa8TxTfVLkkuzaqp7KDjPYZd7DKrACJY7i4hNYWyZqJnFZSArZ9ywSoV/821qrQxXwWcUdgjeN+JnanXH1DfzKD5XyqVln2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:51:45.5977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b1a72f-8b6a-4335-f617-08de74537cb7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7575
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/8] spi: stm32: clean up buffer length
	assignment
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.808];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 613F0195516
X-Rspamd-Action: no action



On 2/21/26 10:42, Dario Binacchi wrote:
> Remove redundant divisions by using the already available xferlen
> variable for setting the rx/tx buffer lengths.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/spi/stm32_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
> index a1f31cf653c7..adba97915cd3 100644
> --- a/drivers/spi/stm32_spi.c
> +++ b/drivers/spi/stm32_spi.c
> @@ -404,8 +404,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
>  
>  	priv->tx_buf = dout;
>  	priv->rx_buf = din;
> -	priv->tx_len = priv->tx_buf ? bitlen / 8 : 0;
> -	priv->rx_len = priv->rx_buf ? bitlen / 8 : 0;
> +	priv->tx_len = priv->tx_buf ? xferlen : 0;
> +	priv->rx_len = priv->rx_buf ? xferlen : 0;
>  
>  	mode = SPI_FULL_DUPLEX;
>  	if (!priv->tx_buf)

Hi Dario

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
