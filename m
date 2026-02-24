Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOgzKtx+nWk/QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:35:08 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4346218574F
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:35:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D239CC8F286;
	Tue, 24 Feb 2026 10:35:07 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ACF3C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3V6uv+mNhiZld5TmHT8uqFKQWWCmHLft8FIih4gIyeaR/zThIo6hgxq1bpgGbmmDCxVggzydbwlxSwDItMF+248YU+oi175YEpWxbAMGOJQPJtRL41QFUQehNxn1rUgOx/V/LMbQ057uj2CFpGJQJkZRxuVosgU6Wp3+Udu9youa1dMSB0sDBCUMs7gdq5dh2BjWOKiiPtomVVuTHzje/pfVLgQ8mrbjYtGtoVyT3xLe6G3cKfRLae2T8NsPIleAsdRp530ovsypOQArj2ohNnfxNtf7kAWxFE6GLcPNby93s7Qpxns9++VdGGGzv9IpnjskYOfKX531qXeb/QjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBkF5UQDTb0aU3KlU4gTDLf7hy5188kqjyLj0wvIv1g=;
 b=qn2fs5DGylKhUHNGVVTWNYDPYYdJ4wMT44jhb5lkg1ld5KlXgj9Flt9+RG62E2lFXuCZ78eLjlYG1TJCBtnmgCV9+rFmoIF99V2cvySX/DneXKMExT1TnNfaTn7vRlMhkERVlr9HstPCzY0pPIZR5m6oyXKacE9kg4ZxOZsFaLqc98NOQ9IV/NHJf5dF5e+rJeNuKbY8+TorYzyouuhVPjsKQNYhBaG4i+L1J9VtEbe0LBAbrk+6aSJLcP53/C5kbBB2QFpt7JPzQ99HObBvH/7Y4jvhbNur5RnwN//9f8AIlBEPNY8uvsLwOs6/vsFqD5iHzlzTT16iAEyUhHFNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBkF5UQDTb0aU3KlU4gTDLf7hy5188kqjyLj0wvIv1g=;
 b=CUmFx3jVUQBE8LZ4gFzJJJmmr31sVCwU229db7YYXfAyZ7ce2gwI+wZB8UFxQkXw41J05tOGhbUVMXBWLPa06qE3b6eyX27i/ho4TSOqEo4bqvoWLxfgnNQA2ngwm5jSyX4w7iB+xNGiDCH1cs8/BTgOVkxZRQ8u+ExFPwQcfbWgLaZGy4xX/klGXYXo+nblv7TVsvvAvifGtLyJLZtWBhTk+s70J0zDzz62xr4tD8tIgQCZ8M4/2HXoRGUuQk7D6k8EMs/NNRWDg2C41UVGkMsN0HapKDu7DfU/e9NAjjAjqPEwSDe/aYQO+fMLlUSRGFUe0+FP3F6lZ3GSIDiLLw==
Received: from DUZPR01CA0346.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::29) by DU0PR10MB7484.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:427::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:35:02 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::55) by DUZPR01CA0346.outlook.office365.com
 (2603:10a6:10:4b8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:35:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:36:45 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:34:38 +0100
Message-ID: <d97423f5-ed08-4c70-8061-686a8effc97e@foss.st.com>
Date: Tue, 24 Feb 2026 11:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_stm32mp2_cpu_fix-v1-1-f37c509d79da@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260210-upstream_stm32mp2_cpu_fix-v1-1-f37c509d79da@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|DU0PR10MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d883b84-b94d-46f3-c325-08de73905dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlVEZ0R2djNyY0U3cmJtZTJXRlVud3JLZkNZQXM2Qm5LRW05UWZrNzVLYXBi?=
 =?utf-8?B?OUlqVjF0T3c2WEtwczVybTgxbW9lRTBlVzNuN25iamtmS282b0xmd0g0YTRr?=
 =?utf-8?B?b0QxbVBkcEVLNFdSUU5lTjdudE42Z2lhR1daTzhFK0d1b3F0azVnQUFHK3RJ?=
 =?utf-8?B?SmxnTTg1UjFKcGtQNnU0U2k2MDhjYi9uWG41dXREZmNpclhYY0FxRUtKZ0Z2?=
 =?utf-8?B?QWdvSzRBKzV5czJDSnBZSlQzQzhFcU0vRTUyTVVFMUw4cWFhT1BGbUJmenhv?=
 =?utf-8?B?UUloeFVvOVovOFArTDA2N0ZGd0FYcit2QnVWbDJla3J2b0F3TjVVd3lvb2h3?=
 =?utf-8?B?K0xSdFROMzdobkFjTHNnYWVwazdua1lldVIzU05vMm1OekNpSmxZR1BzMjNh?=
 =?utf-8?B?bjF5M0k5MGM0enNxUCs4RHVtQW1mVlUraHlVUCtxRFpSb2tSbXJvOGFtWUFm?=
 =?utf-8?B?bW5aaUdxeml4N3Zub2JVcjNIczI2VFpvcUJvRGZKOE45Y3RvOXkwRHVzNmpI?=
 =?utf-8?B?TVc2R1JKQTBqYVpOVFFIVE5nK2drRndqdHRQVXBUV0lUWUFDQVdDMDRWeTJN?=
 =?utf-8?B?eERibXkxZ1NYZlhTbzVnU1ZsTUxHcnZqRGhOdTdZSFBqZ3lWVmJQdFRlc0tm?=
 =?utf-8?B?cENFVEYvRWRINVFmNm80ak0wb3lQcEFiUG9nYnlTYmdXblNlVklwMUc5MzJi?=
 =?utf-8?B?cEM1T2p1ZGtIaFhUL21TT2dWNmN6eFdaREhQZW1raE9RTkJGMG9aT0IxcWJt?=
 =?utf-8?B?dmlBdUgwdHBoaVRhbno5eER0dkNSTTdPSmpyay8xOFROY2pvUGRlZEVtVVdP?=
 =?utf-8?B?dTJSODdMOWVvT2ZScldwdk91eU1tS0Jlb25mNUxuUTFlb2QzRFlIK0hzYVBU?=
 =?utf-8?B?bm9TZzgzYWh0OG8rT3lGbCtJSmtRczNZU3FLbjJVbE1ZVzdqclo0TnZGZ0pH?=
 =?utf-8?B?WlVZalJRc2ZGMklpWE10eFhObUFWWkhVR1pFZDUzNml3bmlmcWNPUi8venlN?=
 =?utf-8?B?WXYxclU3WDRNQlA5WTVSRlU5b1pscW9ISkRVbUNqVXFON2ZFTjlMU2kwQkg4?=
 =?utf-8?B?NXZHNVRLNzY2V1o5RFVNMEFqdC9tNlBWR1VTamowdjhYVTErRTdma3dWUlY3?=
 =?utf-8?B?RkhHTlhldzFqS2RBYnpjWXpGZHpNdThXNld3YjUvb3VTemJSZ0wydjF1ZU1Z?=
 =?utf-8?B?RjRwZU9FQmVwdWFKSVIrbjFlY1YyOHBmd1VSTCtJZnBkZERJelZhd1FvY1lT?=
 =?utf-8?B?RHNQWks1aHNYc24reDZFWkpPUmlPQnU1bVZEUjFpdWRKN1VIK2JodWkrYkhV?=
 =?utf-8?B?R2hDRjBxOCtsTmk4WDc4Z1JKM0JVSm0vaUowc21ENW9QTkk2bVdTb3dMbFJ6?=
 =?utf-8?B?K2dLQmZMeXJDZDdzTDRwb2ljYWZ1cld2aFFSYWc5SGl1OEZ2MkZVTlhERWw4?=
 =?utf-8?B?bkU4LzJFRWFEbkRsR3BYWkNDSWNNaHZpUlpuYW14Mk9NUUovRU1yTzlmYlgw?=
 =?utf-8?B?NmJvLzJ5NXBpZU8wU243WThxRXlVYW1qVjZmNDhqVm40aVUxV0pPN3FHZE5W?=
 =?utf-8?B?U0V2RHRZampEeURwdW1TMW93alRUM2hBRGNRNjNad0lpdjR0K3gva1JzQXZ5?=
 =?utf-8?B?ZjRnQkh5YUpaL0dXNS9BMWFmSmRxNEJoMkU3ekFFMFd5dFZKbTMyZmhDVWtt?=
 =?utf-8?B?bktKMDZiMHNabjRTbXRwUFNzdnJkNllybDZ0Qis3SmxiVjYrRHVxWEJxYkNL?=
 =?utf-8?B?Y1lCRDZvcXBET2pQZStCb29pczZUU3VjdGdodm5MdVRNRW9tUEZhUTRYVHBy?=
 =?utf-8?B?TXl3UE9oek9QU0tRU2pZeGNRcERIM2dQSng3VWJrRXJTdEpwT1hkL1ZHa3RZ?=
 =?utf-8?B?WXpxWFZVclVkcXZlMTFyMXNOOVFtWjVqNnJ1eUtjTGZjU3d2UmpFenBNVXQ5?=
 =?utf-8?B?bWRwcG1vWGs0c1RwOWl4OVNUOHpnWUxDNUFLeG1WRFRPSEdPSDR0UyszT0Uy?=
 =?utf-8?B?M2hxbGptR0R1WG9UUjJpK216b01QNU5JcUwraEhWOGFNbEdXNGVWbjV0SjBn?=
 =?utf-8?B?ZXlNOEFBMEdNMWZTVXBUT3lsNURIUkphQ2ZCeEsrVDg4RGx4bXRRY0I2b3I3?=
 =?utf-8?B?L0JiaVNLVytRZXcvWWhleDgrTjd3eFZuSWRXNzZDVEZVRDFLUTNkNDNCZk5s?=
 =?utf-8?B?TUdVc1JEaE1ad2JRWTZoQXMzSUM2UmJsSjZ3WUFJTkdjdVFYRVA3bnFkeTVt?=
 =?utf-8?B?RHpJcXUyKzllbFdsTStuNVBGd1hBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HU8dxsSB8pknnaq/IAQZ2nUValAEiMd36qaRnHjMC3FUDShoOPM0/yevauoT9LrTH9MTMlDOcUTNvzMzam5KC1/yjMmEje0sHzxHWrkGpUBmUnI5NYHrPH4f1QMdrN2zOWGLPS/ahuAhriI5/TYOKkPOJYuRr+imBnPRBi55Mix9XhrLv4TW97Nf+tdfcovQLmpH9dqmWgG/LmEiof7iKexXH/f9g4yuBZluTuRtXKKc0jZTENCTfn5jGWO18ZexBfGGR2ca44dk1tsu/efUgKhZQjkU7JBXjotrjARxsHOEK3UR6a4yLMcVZTPUwKNFBE0jz8Zy+mXwvfxkFknrGxqlDGS7hcV6D5e4FmshoTCQ/qgbJO9CZAIhDN9Mn6gjmFVqkiZ366ZSxlyHMG9l+xC8/WL/LPbr91Ht5sgkQi8s+DOfy5GojidkcJmMepRR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:35:01.8743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d883b84-b94d-46f3-c325-08de73905dd4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7484
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: fix array bounds checks
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.836];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4346218574F
X-Rspamd-Action: no action

Hi,

On 2/10/26 15:57, Patrice Chotard wrote:
> Fix index check against array size. If that index is equal
> to the array size, we'll access one-past-the-end of the array.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp2/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> index e081dc605b8..a8a6bcf8ab4 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> @@ -148,7 +148,7 @@ static void setup_boot_mode(void)
>   		  __func__, boot_ctx, boot_mode, instance, forced_mode);
>   	switch (boot_mode & TAMP_BOOT_DEVICE_MASK) {
>   	case BOOT_SERIAL_UART:
> -		if (instance > ARRAY_SIZE(serial_addr))
> +		if (instance >= ARRAY_SIZE(serial_addr))
>   			break;
>   		/* serial : search associated node in devicetree */
>   		sprintf(cmd, "serial@%x", serial_addr[instance]);
> @@ -178,7 +178,7 @@ static void setup_boot_mode(void)
>   		break;
>   	case BOOT_FLASH_SD:
>   	case BOOT_FLASH_EMMC:
> -		if (instance > ARRAY_SIZE(sdmmc_addr))
> +		if (instance >= ARRAY_SIZE(sdmmc_addr))
>   			break;
>   		/* search associated sdmmc node in devicetree */
>   		sprintf(cmd, "mmc@%x", sdmmc_addr[instance]);
>
> ---
> base-commit: b99da05e1538b8fa153322da82917af2aa27e1d6
> change-id: 20260210-upstream_stm32mp2_cpu_fix-bbbd24ba4f99
>
> Best regards,


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
