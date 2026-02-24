Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA21DO2fnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:56:13 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAABE187489
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:56:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8413AC8F286;
	Tue, 24 Feb 2026 12:56:12 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94D38C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 12:56:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRDVnky0wQnMr/3mFPbdPg0rCxzNPn2e+A/cNexT3oJtW4XIngvxT6dOKlzdWDnXsVFcJheoDYwfBk9CHpPFT+GNC9O9am7buKfl1gRh9eDtJaHvzIOQafv5qTthXIpEzrJaCsuWGquBKcbvZ56AZDaybPw3fxjJW0coZj7AxbmswO9K7jPdiLgFuwa1jbuRXpxMq+e00d2M3HoyYWy92Hq0UiQiNubKcGi2JUxNjGUdi1A1tHvnPRxU0paW321FrSlT0oGV8pjdLmT0hgLaql6CWAYXT/EhheyiXfoB7b4IrtgifU6pYTkEzER8OUeMjoLmB6lm2QkjYHdEOAp+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEUL9tnBq/W69WBzOn62HjgRybkKy/mEHnYSemqFPn8=;
 b=omqPytMVo69XHnHDfFDV9nYQjV0ziJeP3GhitUfy62Tv2o7NSvBAu9J31pIEI/CnM4BF1g9lrmj12xkn9kCRNNqGba+9XfAEgB3rjmINzU3cCNb2E7NsE/h0Z89uFhr3JwDEVZ7oj3fPBJywnNXnxp0f9M/RHCrA8Gi1rk1STqJQam2p4wGYrOgvAf7muvSAtBrcVr/bZTJoDKOzRX042BpQhpNLFYIrEY12sgA/ncgudYStuPp0Fti6ZxBzc2U9RVAzphUSMdKwihkxsbhzpJnDrn9eAdZZkviqoRj0E1Sia0CYOvk2bLscGbn1VjO6D6WozKWSg2NkcIenCQjNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEUL9tnBq/W69WBzOn62HjgRybkKy/mEHnYSemqFPn8=;
 b=dwuxSuPbwg2AJYKitHFcdoqN+HtSZU9aKpNu7anp6zfsDOznBYxFhgvoHdmkrQMemKDES1mxwFAO64b0+a4qPy0yUMi81AuMF9HqnISr4Ejxa615rHbSP9koUNCrnxMakfTaYP9nbAefHhTPSIzJlGKyLn0LwXTzvbxmIPbchvIav3l53Z1BgHuZn0lOnBRgTEzXgFWOJKoA/WkPIzOa7OGSGWmGI0N7x7cvBAnK+jy68Bb3SVz+7vCsfo7KiJy0C4Wm4lX/2ebfn/Zn+WlScfsaCSUESHEqG26mT5OfnW2zpq0xjwTERpo0l77L8vDLT+Q3VEq74xexGWTQuXNFWw==
Received: from AS4P190CA0037.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::18)
 by VI0PR10MB9217.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:56:09 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::b8) by AS4P190CA0037.outlook.office365.com
 (2603:10a6:20b:5d1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 12:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 12:56:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:58:15 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:56:07 +0100
Message-ID: <15be74ae-0ff1-4117-870c-87ad6201a5f6@foss.st.com>
Date: Tue, 24 Feb 2026 13:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
 <20260204-upstream_factorize_and_update_read_idc-v2-2-7f0baa41d2f1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v2-2-7f0baa41d2f1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|VI0PR10MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ecb01d-95be-4d6f-191e-08de73a4144d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01ybTBUR2F3cHUvZ0tnYjh1MTZ0bUdNek5tc1IzK0RzZ3d2Q2psM1hQNUVu?=
 =?utf-8?B?RFlvWm9aa3Y1NzlxSklhVk5uWCthNkdzTE1rOVMwOTVaVHlEb0d5YTNwOFBM?=
 =?utf-8?B?d0VOT0RPMk9IZ2NWVjNLZ0VlRTY0ZFllU2pIUVkvYmtaOE5aV0lIcnljOTM2?=
 =?utf-8?B?UTl2ZFdPY0hoa2Z1aUxlSlpoSFVBa2dPS3l4MXhrVHRNYnFPMmx2VExYWGli?=
 =?utf-8?B?U3A1czJHaERYcVE2dGNKbWcvZnBZbURibkszTmZzYUtXdm9OQURQSDdZT3RJ?=
 =?utf-8?B?b29rZVpjcTlXYUZFY0JITWJURENSWEhyZUU0VzNnbHg5YXJEb0NmM0s2Y0x1?=
 =?utf-8?B?cjNVejZQSGtubzNtaFlXREdqdThyeE52NHFPNVNocm1PUXRHOFZaTlNCbjd1?=
 =?utf-8?B?S0JLcGR6QXdRU0paMFgrRzNOVkk1Qk1pSDZFZVFXRkh5djYrS0MyOURyL3NN?=
 =?utf-8?B?bHFDRzJzbVlwbHpuRU9WT0kwWFZzNHBwZ2p4RVQ3WVloaGlSSlJIV2JaeVdL?=
 =?utf-8?B?cWYzRG5FWmF2SEVDVWRGVVJQR2E1M0dXM2cvQkxOVVJtTTBhQXlSME5tU2ZL?=
 =?utf-8?B?UEpNSTdjRWQwcHZRb2lSS2tBWG1kejhFWE1kWDhXb3gvTnU0djA4ZElnQSsx?=
 =?utf-8?B?blpPcnY2bi9PRHhTVXlWaVJYWUlUU1V0MHVMMzluVEhVT1BZOWpaOEtKdlZV?=
 =?utf-8?B?WEU2MUtmTWJXOEszWStJeURTY29DTSsraDNSOGtmaHZNa2lNbm4zVDdxdzFm?=
 =?utf-8?B?SVo4OHpLMWxhZWtWdHVoblViTDdyVDNEYmVYN2Uyb0YwNWJOaHc0cGJJTEI4?=
 =?utf-8?B?a2xnMVFxTVF4WnNSU2Q5ZW9lWnBtUEpvTDY5QkpEWWI3SHBRbjQ4S29GbUxy?=
 =?utf-8?B?NGNjeFZ4SGpTV0oxQmh0K0lBTWRKS3YyQ0xDVHFtRVFCZWFyZnBwSlh3S2dE?=
 =?utf-8?B?bzh2VndyVHl4ZnMzMkFKVzN1TzRWdFBHMGs4OWVsNlRBUHNGbXMxTng0L010?=
 =?utf-8?B?dU51TFhFQ0tuTEt1eDR4dXlRYmNmMkNZdWd1Sjdpa3BOOEJqOUpFSlAwTTU0?=
 =?utf-8?B?NTZPRUlWTmVaNUF3QkV3Mk9nRHA4amR4dXRHK2tNZ095YURQaUdZU1JFcXJo?=
 =?utf-8?B?UzgxZ2EzY2NDTUlFdGI4UUtmcWlhMHZTVFFTcEcwS0NYUUo3SmE2YWZOQmJM?=
 =?utf-8?B?eCtRS1M4RjA2TS80ZUIwblQ0TGU2eVM2ZGp3SUIxN3l6TksveHBQeTMvT2N4?=
 =?utf-8?B?WnR1NHZ3eEFaMTRpdC9neDgvTmN1Nlg1aXpUdlJ2eHBoWUtMcFc1OUcwQ2pC?=
 =?utf-8?B?SS9sNDIzUFFHNmxsaVZ4aHVTTHphVHYxL1pnNGZFNGhmNGFkNVZsKzJQOXFG?=
 =?utf-8?B?azNuSTZDOFpJUUJxQVJyM3h5eUpmQ2dkZzBZcUQvZGhBcm9sdmNRZlcwSTkz?=
 =?utf-8?B?YlU0TnBhQmVsajNteXJYYmNjaUhPbVplK3JoekgwLzRwUnd5ZkNqOUtRZ0s5?=
 =?utf-8?B?MjZuRFM5Ylo0Qzh2UnRnaWd2dkNMRWRreFFLY1RTV0dtS3E2NlFwT2tMNWlp?=
 =?utf-8?B?SVB3azBYTzdMeHhvNHY0MlEzVXlxckxPSTJ4TVR2Q28zOWZFOUp4MVd3TFk3?=
 =?utf-8?B?amxSaUh5NW91d1c4UlZFbkxWeW1iSEJIQzhWZU53MzNYeEphYi9SL3ByWWt4?=
 =?utf-8?B?dkRkU0JobGpFMVNkQUVQNUdkU3NrcGtBK1ZJelhBOHV1S2lNcXFYaGNMTk1h?=
 =?utf-8?B?Z3ZMY2hKVVBjU01CWVlMY2M1NXpIN1EyQjkzZVNBMEVIZ3lmcG9DREhMaEJv?=
 =?utf-8?B?L2hoT0dNMVRjL0dtOEd5UHJBYVdLQXF3S0swWlBvTHdScVNJYUxCWVVzRzIr?=
 =?utf-8?B?OWk1TFo0bzlVSTFqeDl2Qk1tRmo2RGhCT3orY1g2UmZQbnNBcDlPNXVFVEZw?=
 =?utf-8?B?SFFublhZQWpZcHk5V3lVWHZENUZwK25xUlBLSFNKOG5sQmswdVdrOWtib3VJ?=
 =?utf-8?B?VGN1b2xlWTdZRkFnalNQRlQyZkV3MGZTWnk3VlU2US9icEVNVTExb3A5czBY?=
 =?utf-8?B?bm10eXc5QlJ6TWIvUFlPS0Z5ZWhWemNYUHpxVXNGSEZaakw1TlRqUlIzZlVG?=
 =?utf-8?B?Z2VteEpIT0VUY3JjL2dITER6OFBORDdkQWJjWUF6VUFnOXNvV1pRU082RUsw?=
 =?utf-8?B?Smp2bXFGUmI2UHZWVEZYZk96cC9INkVucDdaQWFXb1JmVmpxTmJUUkhjRzhK?=
 =?utf-8?B?cW9kNHhBVkp1ZDZWcjAybEtJeGd3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z4qgILgjTNqAmbNwsE0JnfQydfIRa4ZD5uc1iGBRTwjV9fyvyctqBtCnq9qbqCa6pgp4yNky75kN2IgQH8Ode9NvMe25Jph1nMcucfsbwGoxN1LOhNV4ZMHYQnMQlBtJzYSCQDXSUzlT0EhZdttFzcCF3+XyBTYuXepKo5jdcLKnNhz7pWxSM2T5XvqkIoKYKLKvNUT40AmWyFRNjhmmDPA4yzZOOuAynR+YYv0u4Ty54moJBKO7SVIeKaxokKvtYeLX1HkDLWB0A29hYZF+aA0EKz4xfA7BpYk9mtbfETYvMgaYbnDyTGIA1zUK9PXda1JGz90R0hcsZCOGrlz2cBVrRmFNpY8Do0TZ4+lYwVTPk8RAhDS4PGfl8/mG5X6rGUZJWC/vAYp5gvskgDtMO4Y0TfMJlYKUVzYP1dxXWs2YbIVWU19GSfPl/51H+wN+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:56:08.4753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ecb01d-95be-4d6f-191e-08de73a4144d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9217
Cc: Marek Vasut <marek.vasut@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] stm32mp2: Add check on
 syscon_get_first_range() return value
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut@mailbox.org,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,m:md.asadullah@eds-india.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.839];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAABE187489
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:16, Patrice Chotard wrote:
> syscon_get_first_range()'s return value is used as base address to perform
> a read, without any checks.
> In case stmp32mp_syscon is not binded, syscon_get_first_range() returns
> -ENODEV which leads to a "Synchronous abort".
>
> Add syscon_get_first_range() check on return value.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
> index 551601a12a9..40fceac402c 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
> @@ -9,6 +9,7 @@
>   #include <syscon.h>
>   #include <asm/io.h>
>   #include <asm/arch/sys_proto.h>
> +#include <linux/err.h>
>   
>   /* SYSCFG register */
>   #define SYSCFG_DEVICEID_OFFSET		0x6400
> @@ -30,6 +31,12 @@ static u32 read_deviceid(void)
>   {
>   	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>   
> +	if (IS_ERR(syscfg)) {
> +		pr_err("Error, can't get SYSCON range (%ld)\n", PTR_ERR(syscfg));
> +
> +		return PTR_ERR(syscfg);
> +	}
> +
>   	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
>   }
>   
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
