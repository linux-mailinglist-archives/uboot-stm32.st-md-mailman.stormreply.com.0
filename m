Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMZ5IiejnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:09:59 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACF187673
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:09:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0C90C8F286;
	Tue, 24 Feb 2026 13:09:58 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94317C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNAuBA8c+f0V1iDpvk9yrppMQBDDeL2oKjYq6yFt0fv731ntEENPl89ZVsG6lqi5oqEPvM361rTonPHu+oJ8NUEJs3t2UQr9c469LiiOcu5NKKNlAcsGyv9wlnOewd11HgFj+P2sZjRFOkEgBfKkQfXN7Xbr45dfxqqSMT7ClMmV2osdiHZNn73Tz3jos0eJg1JmeZE5IpioV5DgZ1mUP+F2Mf73FCifMposSfI0qRSur0uHsWnSAFgVxlTv4OPrjtyWW0MDPrS9VVBudGreR4gLwr0utOGYeEc0gcG4NElmgbgoUYmWi9SL7FwyqQkDttZeMncTv5kkYgb0RvM6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAtDZJ8dcq/IhoZOe/B+enYPlUBYeiWGZpP1AB9ugGQ=;
 b=Ta18KR6O7GBE9iEE8fHdm4yAMqxyy4LvYt92ReDfZ134NHT0pgsOPQA76vABFUm9eq3dqnpVyXS1VVjBsQVaQiONTveC21Smu85FeJ5QIqIemjvz46RPUpMkj1YXWnmgo3sN1a/HyIaeTKvKGrONJwM2lp4mU1//KnfXK9Awb8uoUnGF/Whpes4UuhjEXF2XtcigHD3ItAIJD7g/5KKzXNmao0KdDmXfLr2gnuhyoY3nU2bfX1RA+VhFK0V7++gIekJiFfJrSUDbnur5COK8zW4oND/D5QMtYPtT5dyutM1JE2lDJMklf7+UUmzOVrv/teOjF4Rr4mKhLz1tOMAZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAtDZJ8dcq/IhoZOe/B+enYPlUBYeiWGZpP1AB9ugGQ=;
 b=AZgY9vmis9eaRrATj8Qy4CThPK4QcRyCZjunZH7JYOrRCoMd/SDGukgo+vuxhAWZfLgu8aVI2L7s0RAUv5qE3ojqUsK39XMXC86rLbwUkDTSaKj+T8tPWd56qtwnnIMreHqwxltkYnJoxZ/tXbTglkwfkDob0eqkk9ly3wOy/YyreEnh3+D4iIn7xpnDMotPR1w3Tl1di78BpYiesBfW/rpzKbleXii+PgyfvPDOpuYW/6B2rPbaOznAJgMdY7DsN3wK5gTUyheE2M+W0KjnH4i5FHpE65/W27jiv1q6DZYJr035IYHO43ceQrods7DGWeHjC4xK1uoKSxJIvbeKlQ==
Received: from AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28)
 by PAWPR10MB8043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:384::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:09:53 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::83) by AM9P193CA0023.outlook.office365.com
 (2603:10a6:20b:21e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 13:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:09:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:12:09 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:09:52 +0100
Message-ID: <0dccb8fb-063a-4c0d-8ed5-96c8b0335a00@foss.st.com>
Date: Tue, 24 Feb 2026 14:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-2-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-2-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|PAWPR10MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbf919f-8579-40c0-dc45-08de73a6001a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTVJeFZsTnpaYVhlL2pROUg5cW5yWGNtaUhUdXQ3ckVtN29aK1hkeUM2UC9y?=
 =?utf-8?B?a2ZueUNoQmtiTkRReXd1dGZ3dDM3eUJoSU5CL29VSC91OEdsOGNkY1NSaE9V?=
 =?utf-8?B?YStzZmRVT3NFNUVWc09lTHV0VVhwbnV0UkYxVFl1Mjg3TXhISlIzWDNnUGtt?=
 =?utf-8?B?dDAvM2g2TVpUcnd2SEhjRlRNaGlwUCt1eCtGQ0h6RUJXSFh6dGozRGs2bU42?=
 =?utf-8?B?R3dYSURJS1d1SzRnKzJGakJJUDI4d2Y2TlY2V1E1VW1Sdnc5U0pOWmxFcjJa?=
 =?utf-8?B?TzJHWVBqSzV5RElwelNxWmRVS2NIRlhtMlZVdXF4SnpMSHVHTDRXbGZQaEdP?=
 =?utf-8?B?YkZYMGZmblNENENrcEV3Y0Flb2hXZFArOCtoZnlPT0lhODRoeWVhNjNVYWVY?=
 =?utf-8?B?SUhHUmpqQXdldWs1WVMxNUJnVHVxeU5nNWZiUEZkdTFwUlY2cmFWZVJ6K2Ey?=
 =?utf-8?B?Z0p2MXpuMjhwRStRbm9aQWlSRXpoUUZzb1A2WmZNRjYxdXhsd21Sc0tEVVZm?=
 =?utf-8?B?SjFqcUFWWldZcGM4K0ViL3B5QWRnU2FHWHJtZzdJdDlQbUFTeHdyY1dNc0Jp?=
 =?utf-8?B?b1dtRWRHUlM3djc1enhaKzlOSkRzenhQb09pcFFLR3NRSklBc3VOZy9Ca3Nv?=
 =?utf-8?B?aytHTTdFbHIrWlVCR0pucFlkN0ozeGJMZXNFSkdKdjNEaXdMYkNwbDdhblMw?=
 =?utf-8?B?RitiVzFUMmVlZzRhbGhDK0kzUzJTMVNYN0s2Sk9OREFHYzY3N2I1S1VDYUZx?=
 =?utf-8?B?c1Rub25EM2FMYS9ScXBsVERFd1ZkcE95ZkRxcG5pWVowSWJqRHl5d1RiZGE5?=
 =?utf-8?B?V0hQY2hGeXZudkVzd2l2dlBnNTBwSVhheTJMcnBRK2lMUnVEV0RiOWpRY3ZO?=
 =?utf-8?B?K095WWRKVFNlT3ZNOHdFOHVSNEd3dW9hTmVnSmFNMEw3RUdRRklWNVFrZ09F?=
 =?utf-8?B?NzZtU2RHSE8zV0NmWE9PbE9GNmdYNXM4d2hkZlZYK0JlV2FaTzFQUDh6RFcr?=
 =?utf-8?B?WGY5OXhwQUw4NFoyT2Y5ZjZpdklodUQ1ZHBhUDhIZFdlTFh2SEQyalBRSW5L?=
 =?utf-8?B?a2pBTlMvNVVoa2FGZjRVMERTUjBwd1VDU1Y3SVErZGMxOG1XdkI2UHBJQ0xa?=
 =?utf-8?B?STROMTAxYktqb1BFT2JzOWIvRk41Q1JMZWhhWkIzYlBhcGI2UmV6RWJtZUg0?=
 =?utf-8?B?QzdHNGpKdEVZMW4yNTZ1MVoybmpEaHRtU3J5dkkydVMvU1JmZXhmcUtETkdv?=
 =?utf-8?B?d055cEtOVXpIMjRWYzdqZUpzbjNVSkNJRmswSnBuZmFRUGhRVytKY2R3MVhS?=
 =?utf-8?B?Z2VQb0kvOEp0K05NQk9DeFJBRW9qbjZYWExyYVlTMXVNYytTVjE2TFh1dzVS?=
 =?utf-8?B?dHlRdDZlOFhEZm1rdTk4YXRGK0JZNnRVc0YvRWdqMEpGQW4yR215MFRYUGg3?=
 =?utf-8?B?NlpvYjNvbzc5cXZvSENtR0FRYUt0eW9MeUpGekdOUHJ2N2lsMFlRMUZyUmcy?=
 =?utf-8?B?S3pSSTFHK1pOSWVpaTRuaUVTVGFZaG1kVGNVWXZwREpxcFhhZHRjK2RwSU9F?=
 =?utf-8?B?M0EvZ3lZbjBqL0doMnhOMnRHcWN4NnFNd2NBd2xZakJlaUI0RkhrSmRrcGRZ?=
 =?utf-8?B?S0pPdVViQXNxZk9tVXdDcEZaMXZ0OGVmWk15UG1mN2o5Y2pPRWxmN0JNSWQw?=
 =?utf-8?B?TW96T1JmOXpkYmtLOVJtR3FsbE00VThwREJjelhrVTF5M1QyS1U2eFFXK0Z3?=
 =?utf-8?B?TDlicWMyYUpFWDZ5T0NScTllcXlJSTY4WTdzMmI4b3dLemlobjFRSGYyVHUr?=
 =?utf-8?B?Y2xTNkxsZldQUkMrVUhSZ1BRTFNtbjhHTEpzd211UjczVU5GZFpBTmRvcXFW?=
 =?utf-8?B?Tkk2MURNelFNemhtVDdyQ2gyelNVN3BXVGNpVmdDanNqdGdUdnBBS3RRM05m?=
 =?utf-8?B?LzJwMFRBdStCTkpBcjdNWHNGRHYyN1ppRU5SN05WVzlLcDlVRVMrSTV0ZGds?=
 =?utf-8?B?RTZLVVpwdzNnQ1FRbmZNU1J3My83V05wb0R0YldFT2tXS2hmUTUvY0h2MDU1?=
 =?utf-8?B?VVpnMGw0c0dRYUcrSFduYUhRZU9GMXpZcHdyWjcwMlNyRGkrRWFxaEhjL3Va?=
 =?utf-8?B?U0dHRGpPZDZ2SDdWM3dLcnlmT01yNnE4OGkzTEpJWllUR09vZmVjeGM5NTFv?=
 =?utf-8?B?UHBReWxwTnArc3F3R2RNQ3lRNHlhZ0UxZTkrV3hSbjFtNEZoZm5xdnV6YkhO?=
 =?utf-8?B?dnZidWRRYXdzVzBKbit3RDZVRFVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tdd2QYnesrE4lMMrHP0ptQ5UccNXLVj5Hx2sLT+yUmkt8dlB6JHhLS4VgHAoDCCbqavwCpme9XKoaoqohQUJAjfZPV5mZmDUVsnoMXxugveHQ0y3ibv8MqRI2ZGr0/ZnNPWYhwJTs4caHhAIp/gCcWgFJ/SdVCm7rt+5odQBonCP5kWFB+4vupUg04sYUoMH52TY8DVg3lTZMXXFAMvEtQdBypydC5Z3Q+quwoyxJLUJd6rIVOMbVyg/PB6QwowmwBJ3AWeGo5ABnjhkCyZIEZllXW/teingzINBvYHVDSkR0VoUBLyngKlTVkeyWuLdcMU/26jic8JwUW260Frh7mN6EnlTmALwgwDLbpcCaPDn4p7EEwwnIInCuK5Ywa2eZ0Q6/gPXMMcuy07rUs8m6FrVgG92UCIyV3d9Hc/VaUs7jv5SPaPIdUm1nsHatk4S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:09:53.5906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbf919f-8579-40c0-dc45-08de73a6001a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8043
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/7] reset: stm32mp21: add stm32mp21 reset
	driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.837];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DACF187673
X-Rspamd-Action: no action

Hi,,

On 2/3/26 17:49, Patrice Chotard wrote:
> Implement STM32MP21 reset drivers using stm32-core-reset API.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/reset/stm32/Kconfig            |   7 ++
>   drivers/reset/stm32/Makefile           |   1 +
>   drivers/reset/stm32/stm32-reset-mp21.c | 136 +++++++++++++++++++++++++++++++++
>   3 files changed, 144 insertions(+)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
