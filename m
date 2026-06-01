Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHVsM/9wHWrFawkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 01 Jun 2026 13:46:07 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192461E88E
	for <lists+uboot-stm32@lfdr.de>; Mon, 01 Jun 2026 13:46:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56E69C5F1C5;
	Mon,  1 Jun 2026 11:40:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013051.outbound.protection.outlook.com
 [52.101.83.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB23FCFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2026 11:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqmnujFz/SlbEDoGz88QQ0PXHl4ZLzHi51gqE7gKpYCDCtWTg4efIQThJzwyDO4yFlAChZGRqqGUuKHML/PM8FIAjm0zf2fEt8OZn+6wxhkMcMOI6CJcl5tAt1aTZogmOVzvNjbWnuQiawJ+ChVxFMepe0BMvR1ZM+Y4BwNSf3XbtOOtCvXkbMeqslMGM93tdyOAUBDmCUpPBaE7tqFKkooic++Vck3Kz0H/W0lcwg2VdVMKuREe21OCbCPBTV/exXO+TLI07TsFLhlKnZCa6oarOwtgVRQpjpNUk2SWWo/vJDrjekKnUIBnrPdconqHSaHrRUWNlVifQi+QgA9uEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQoBppXh6nS3P1l/UtsFWNDcDKrmEl1ISlvxhxEdvtY=;
 b=l87NJK4BAWWEJcphKWWx0R5zuDdo4UwDJqezm7VWUV1yRImyBo4EDIK5fXfgxo7G7iRSXfW6i9a0lauq4CaBVAzmRmHj80JNeLzBovuCnBxDdvvMQkAwpLYK+3aZtWmTJWwJruszDzmIqqzRfgZ0Nfl/B7BHQpAX1pKO7w3H0Q9yAHdWjztT+n3H8GAVwlkiQDOwUH3rUTBMVcMLT0XTNHwiqY1f8zPoOHjzdNiST6Lw5qszqENxF/CfZfksWTU+Z9glwGUwVhYhSzJ6nXpG6mUHvvxBMhjq7GFQ/N+3OWS69Zm8tH6572W35ez9VATll8B1M4GJvemULE/sKVTJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQoBppXh6nS3P1l/UtsFWNDcDKrmEl1ISlvxhxEdvtY=;
 b=RdMxTL3p+96BgL1iVb8SUlhphCixhkLpi8qssDxASn1o+mHbLcZqlzJMR8qTrDY7uwwNwvgFQG12b0aJsg+aompai8sCvM16w7pI34ce3Vzex/KYcpzlu0ABYaPnqHNU5D5q8yuFemKYe4GiGRy9XfM7hPwEmPpuOdMIbEJd1wXjN/EtuooiUaEoQ0CkS4gpwNU2YKF/3ojOoRtmFPLrkGmiT9JFAHbKd6gqfCHJzlXlobdFcN72OUTG+zagvKVcGAvfdnf8+SolpbFtR1bCRSQKHPfvV1MoQalqrK0b8KfzfVnE8XXaXBmFvqZ2iL3QJaaW2Nlkq8s85Q6f6atHtw==
Received: from CWLP265CA0473.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::6)
 by DU0PR10MB7167.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 11:40:17 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::98) by CWLP265CA0473.outlook.office365.com
 (2603:10a6:400:1d4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 11:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 11:40:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 13:43:58 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 13:40:13 +0200
Message-ID: <44aada6f-34dc-4dd5-ad03-23de57674f91@foss.st.com>
Date: Mon, 1 Jun 2026 13:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, Yann Gautier
 <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
 <f48f9d8d-4b14-4745-8c96-2c315889f770@mailbox.org>
 <b74d784c-9728-4242-a9d0-e0c805048c7d@foss.st.com>
 <66ed0a35-105a-4919-86b2-7be6eeca1e9d@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <66ed0a35-105a-4919-86b2-7be6eeca1e9d@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DU0PR10MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4016f5-9e9e-40b2-7458-08debfd28d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: yFMWUh7ipcrbXSNAS+Rz5jb1mdAhO6/wbUm/YLhQjPbgwkvpUBhTtmfm74DnvKhvPs90GmhpXwjjaT70XIu9z4ZnbOzNdjHg/4D6ARrMf4e3L+rZi/C7hGiH1RPbKIVSlSVz5EbcdRN4SyHhXEEHlj7HfmXvu93l7kuoh7VtaORmESM3B/cbZrMEnNhpUTNWBm/ERmLyWZDrq4ifE46lEKlnrus0xzlCT6QYP8P4akUFuqX6NJcLOcJJ0quD/QHiKSxDoRARCo1yPvdbLIbel2Rnpnmb8B7q98p9hJo730lD2N0zmiFF5AbQAoX5qxdvv8UPlarkbfSHs2KAPUrFTiQXlQG3XkmRcUiC18TH5qQlQ1OHIXI7Rn7GQAPzBXgXf5ISNyLQbQDKJPYio+W9QOQZ0ItNyyuml722Ka4S9PuGO/FeRNdsMopROB3+XCpyxy5BqeREGPC+yr2kVdqIZ+QJBE2+3SAIRnyi+JdqbmiEvOnf5x36cKWOzUlBOp6jUx4/I/mLEE+2dli6hryk1xI+w2iagIVxfd1s0AtdcD+Eb6u+op7YfA14K8MeiTc0XT2MhVU5EZAuN+Bdb10kxtmHAS63MI5PpFZrriWRiiD8pkrU6wv3eecqp14WtHm1JWUiKpTeFIf0pAyPPrXi6ZWrSELnj2XGxy9uUS8aq7wK9NwTjStkJavHFstmxH78h7YAZukF1Fb00BOHNESD3tofaShbPhfwn7KUAeu9I9E=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /FH0GSANKupIaAMlo0qrjgqU3YKV+Y8/JtykLFuMnnYO9wLbWQXoUMZk439JSvzqOdmaHB2lIXHA4yBurNewm3Tz6zYgb6InSRxAgambt/fZzB9uMhagcKSZX/wxpykqjCgrX9E3b5BLb/R7SS5pEXFFhyQdaEwycxGrf4yYZgUhpu8lOml+KK3us486l/0OwKIOT1mAFiWFY4igR1ldebhFQxLvZ322kxpWDRp7X1H6QUE0olKB0+kA9Uk5QjYzB98eyL5el4/vSTMhmRo5AQNWsB+HkGmbm2RGJDdLfk9VVBBcbtRVTqoNDnHSQvgvJ1GHgBBepsiAPb4xDqxwrWWpgIfB21RAu+aiZb2AtK6r8c/nyYmSmEYPmMO8voIVnwUL0RqVWQmMMod9tRXQQGPZBP1/Ci8MSqQqsCLcTf/QzU/pzB2ufb5Gdqva6mQ5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:40:16.9741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4016f5-9e9e-40b2-7458-08debfd28d76
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7167
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Enable Arm SMC watchdog for
	STM32MP1
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.898];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7192461E88E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/26 13:12, Marek Vasut wrote:
> On 5/21/26 9:20 AM, Yann Gautier wrote:
>> On 5/20/26 18:38, Marek Vasut wrote:
>>> On 5/20/26 6:07 PM, Yann Gautier wrote:
>>>> This series adds the supports for Arm SMC watchdog for STM32MP1x
>>>> platforms. This enables the required config flags for both STM32MP13
>>>> and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
>>>> in SCMI configuration.
>>>>
>>>> This series also requires a patch from Patrice[1] increasing the
>>>> CONFIG_SYS_MALLOC_F_LEN for STM32MP15.
>>>>
>>>> [1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518- master- v1-1-37fd4df56609@foss.st.com/
>>>
>>> I hate to nitpick at this point, but, it seems the two patches in this series do effectively the same thing.
>>
>> Not really, the watchdog config was already there for STM32MP15, and we now enable and use the Arm SMC watchdog.
>> For STM32MP13, no watchdog was configured at all in U-Boot.
>> So for me the patches titles make sense as they are.
> 
> Sorry, was busy with too many other emails.
> 
> 1/3 and 2/3 does the same thing, enable CONFIG_WDT_ARM_SMC, the commit messages should be aligned. Do you even need CONFIG_WDT=y in 2/3 ?
> 
>>> I'd say, align the commit subjects to something like:
>>>
>>> configs: stm32mp15: Enable Arm SMC watchdog
>>>
>>> And:
>>>
>>> configs: stm32mp13: Enable Arm SMC watchdog
>>>
>>> Even the commit messages can likely be aligned ?
>>
>> I'll check if I can improve that.
> Please do.


Hi Marek

For information, this series has been merged last week.

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
