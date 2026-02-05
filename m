Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKeHN99PhGkc2gMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:59 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E00EFBAB
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D5D1C87EDC;
	Thu,  5 Feb 2026 08:07:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013062.outbound.protection.outlook.com
 [52.101.83.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B161EC87ECF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 08:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuySwp71py/9/LUlvkU8MFOUfUmIajtuoL7XCihKRDHCfCC1l5DNlDLKampOUkLPjJzj3OwzZ6QTgtfeU8tZLVMuyHajwjQFnTAMgha6V8BzzkzV4l0eyqFudsheyPSb76m4yo3p7Fpjhgn7hLSq9JxsL4KH5j5Jl+1G9H4lFXpRb5r7UPiiO7rSnNd+/fB2fcXL2E7bX2/dSyEC4KSqYXtTgvb1tNwykyyn3TGElwavFqzzYQDlypk6cauEgceTsllUfbFmwtMGclvwvOGkri/5NbYbKoNw9bjZWIdzuOCNHuj6EPVDQlY1XrO9pgloEAQRpxGX63o5/KWXVScsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtvNGAWmhq7aUFceyaLiVp6KUd/0mE7Gs4HdkYwr3Wc=;
 b=cgLE6fOiDt0OaRjjIv/ENquHUK+05UpnXBqbYwSWKetps2rAMQCqrDNnwAWA/7egeRrJFnGAsWWIGPAe5FJTf/+g2iQQm92ywIgMlqD1Z71xHTQUIxR9xrsQTTAznKb+iypY+5g0LinNRDj87laD96Noe9lwfp9790t0+N9ZR+/0/i1jIg0wf87Q0ylCAnh/O0En8TjStY3a/hY//yiNFytQK6ekv/iOuyWNReuGwUFiFh4cVFbUn88muNvjG0KP712orf90KH3Clp9RuUTrK61UJlWOVg7sONl0LJ9x6bgsSKLU36EfKOrW0NQifEj+ydBjO38Rdsyn2EFRf9vkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtvNGAWmhq7aUFceyaLiVp6KUd/0mE7Gs4HdkYwr3Wc=;
 b=G+U81YGWCt0g2gcOsLk+/JfbjGLzWU9tViuW0fXLV/7rQW7AXVPOqDlrYH8X4zNA/8j4mLme+93uc8oEAZpVt3END7DsnKNTh80bKn0/Bw+FK3rlziZA+Eku36IBEqBq4okiuRVSVfPzHKyucTuU2RXwjXIXH45+hfVIvJM3xkB6BW9pJ0Hka+90WWtbH7EzcMTuIIk7MXfT2OOq0RtSGyezPzOQO9rYxhSg0Lmt/79bnplOpYDw8cLV1p/APyHcGerppt7DRa5RL0117am6z1hx2T8PEWpaaw4DqSQf+HnOKJzMMBBgkRdFKT7GRhiyN6+qqDOLbTFTALSUk+73GQ==
Received: from DU6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::8) by
 AS4PR10MB6136.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:587::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 08:07:52 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::2b) by DU6P191CA0049.outlook.office365.com
 (2603:10a6:10:53e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 08:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 08:07:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:09:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:07:51 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 09:07:50 +0100
MIME-Version: 1.0
Message-ID: <20260205-upstream_pinctrl_stm32_update-v1-2-3a3797af498d@foss.st.com>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AS4PR10MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 2291d4d2-268e-4bd9-b2b8-08de648da90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2F1YUJPK01JZ0RFLzBxN1grV1JjN2E4YVV3Y1U1eVVuZ1hiYTlvRk1LTXJh?=
 =?utf-8?B?N2syWitOUG8ycDZQenBHTG5QT3B4WHFXSEdFN3NjS2xkK3NydEVVelIvWmx3?=
 =?utf-8?B?UFVDWTVPY1hPK0ZBdHgzS29tK0ZnNDRXUDRuelJkT1IyOGNydXcyQXZrRENu?=
 =?utf-8?B?bnNETFQwMVFKUTFZazBabXl3RlBrY2NtNkNtdE1jay9IdDU1aXQ5YmZNWUZG?=
 =?utf-8?B?ZHRGMlFJcGt4UjlWTkY3d2pmSlpLWjcwdUZGYTlRdHpFZHNOOVNJS21peTZy?=
 =?utf-8?B?Yytsem1yb05nOVVtTTVvU01iNEMwWmF4Q0MzcXZMTk03bU5jTG1VOEFaUzhk?=
 =?utf-8?B?NEVWVG1kZTlmZVVlY1V0WW50OXBUK21uT1YzbnRubStTZjZZei9FTk5CZ3Uw?=
 =?utf-8?B?d2xmSDRhU0tJT1htcXN5V05KYnRTY1hEcVFueDQ2emZER2tjZU1UeXZTQ1or?=
 =?utf-8?B?Mk8vVEVlNWk0T1JpdWVSUGFQYzdNMVZNQ2RVak5US1k3S0U2QlFSQlhpcnQv?=
 =?utf-8?B?SWhHSW1IWGcxYlQrTlA2RUxxRHZhTzJXeFdlQTV0NHQ2NWxhdXVHQS9OdDlR?=
 =?utf-8?B?cUpJY0ZJNEJwekpnbjNLNi8rdzUzSzlDZDRhSGkrYmpnOEh0b2RCN3BTME5X?=
 =?utf-8?B?eTI4bmF2RG1JV3cvRzNCdWdINzluMFB3aitSQjd4emJ2VWpPd081YkNMWmJo?=
 =?utf-8?B?VlRjd1B2UzYwRStRdzVoTEZNZHgrMzN2eEhjNCtvOFAya0xJd2JEZHBuNkNB?=
 =?utf-8?B?OEo4czF6cS8wWG91emZFV2pleXc4Z1V6ZTlSV0dVNVcvMWlJTE1zNVFLYVNZ?=
 =?utf-8?B?MjQ3UW9VMmptVUFLNzkzeW5DOWg0R3pFMmlsaWxINmdzeEo0cEdnU2t5bkJX?=
 =?utf-8?B?UTMvdVRVTVJJWXhuYTNteldRcCtOaUx5UmdIaU01M2RJSEMzUjd2T29aWmgv?=
 =?utf-8?B?NGc1SFNQdjVnREtFTGlvQjBEMS81aTJXR2FLWHRrTEtpM3JUMStCd1ptcWJK?=
 =?utf-8?B?ZFYrazZ5eHNNSDk3TENuQ2hvQ1hFL2RmY1IzNWZyNjE0OHM5K3VvQzVwK0gw?=
 =?utf-8?B?SXJTSFI3V0RyRnF3Y0hrOXRBRk5mNytpWUdiSGp4TWsxdUNXUzJyK1I1NDVX?=
 =?utf-8?B?WWNNZEc1Tkc3TE01dkw3Z1FtRnF0enRFOUpGdk5lQXpibXZtSGUzTWNjNUg2?=
 =?utf-8?B?WXRDUXR0UTlReG5jUjBzemlobUp2MnJuaWRmSmZaWUFvUnAyMlBpWnRPMUpO?=
 =?utf-8?B?VjN1SVQwWmtSaFNDQ1ZFSFJNd0ljRStqN2tiNWRUelo0aVdFemFIM3NtR2cw?=
 =?utf-8?B?YVhuNy83MTBkYnNBMG1XYkpMbG9tNVI4ZTliRzBic3BNWVIxeEcxNjdPMTUw?=
 =?utf-8?B?cC8rREpwcVNPNkhjd3dHbWU2a3QzY3JnL1ZWYXhXYkt6cGV0YjNTZlhVSis2?=
 =?utf-8?B?VDFQWmpTdVpIQTBCRHJiNDdxU2dwOElEeVluZjljcjFUY3orZjEzK1ZKdUNU?=
 =?utf-8?B?MkhnV3ltOVBJaVk0MURFOUhxdjQ1RXhYUjVocTlzbDRtd1paY3doRExRVjZQ?=
 =?utf-8?B?aTZPNUcweEtzVUkyTmJXSmN2NERsYnZtaWplajBydWEzVDg1UjgxYXBmNkpP?=
 =?utf-8?B?dzFqTUZEckpWQUlUUGxuRmJJMGtYWDNXeG1GSmErbkhTckZ6ZnEvRDF1TDNL?=
 =?utf-8?B?WlgxZkFGdUNObDhPc0VYd0t3S3pOYkdVSGZFUGhxbjZiajBjT1BHOXg3NlFN?=
 =?utf-8?B?aFdnNkRlRDJEaHBmNlhTL3U5dS8rRW5FNGNVRUI2VDBzanBqT2xXTXB6UmVC?=
 =?utf-8?B?Y3kzQ0NROUJWV0RqSVM3TUxqSEk2Nmc2bVBlRkdBRzVqV0taemhsbEIxdkk2?=
 =?utf-8?B?Ymhob2hnZVhsVm13MWJFZTZ6T1ZGb2cyM2ZVbGI4UUNCVWhGelM2bHRxZ0du?=
 =?utf-8?B?NU1Ba2RlSnFiQW5TTDlkU2pwcmZ5Vk1qM1RJWTJhRmNpcUZMZk83Z0R2UzF1?=
 =?utf-8?B?ZU9Rc2ZSeWg3bGdqc0ZDVUlxbDNZNVZQY0xBRllRK2t2WEhuelJaTnFocnNJ?=
 =?utf-8?B?Z0hiUGNNdUsvWGVuZ0ZERVdRYXdHelphOUJnd0dJRXBGSWFYY0dsN2lwclR1?=
 =?utf-8?B?TmEvU3NWQ1pHTjNDSmxxcFo5Vjg4Q1o4N0hudDVMMzFhMXlPc2NtSDAxNHJV?=
 =?utf-8?B?UEh5alI1VlVsZWRVSCtVY0lHYk1kTDN4MGZvaEJVUU9WV1cyRWFxUG1jdDdx?=
 =?utf-8?B?Rmp1U1VTZkphYUN4ZnZRYjBVN3hnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f8OA85G4x9M5aeXhbn646PpJbbcqxxFcGe8yZ949OjYD7N1UudwUkXb18trsmjqiSg29WEYYofSZIdpCA8RFU5PP/8QTzMuCRRaQprsbb/JfiAI5xZQnej73hUtpTrN0LRTCg5qg5I4AeIAQfPlS+H6QA7C61mLJtzn3URcgknxE5zNoAZHU33ASLfM5bfVrCHuPPSLbnsQZCEcfwUQRAAnnrxlMtd0AC0PRjq0EaRc47L2lCdnzoXnX6Rh2C4NweivNs4hVGtoK+NF9uGjAYUlP+UHun/bIFIPdnDY9mnn/2xE2LA2eZz3+Q2u3cqT9pGMxGnjk0V4UfjV/E+d0mRuI50NF+HtEdn4omRT3gMw59tyqVAP6lxF2p7yLnU9xYvK3jUiprz7F43HQ6Zj7g3xFBrz2LIdObwqpDtWX4tJ7lmV2+bV/NJAlAhB0WyWf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:07:52.1363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2291d4d2-268e-4bd9-b2b8-08de648da90c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6136
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/3] pinctrl: pinctrl_stm32: prevent the use
 of the secure protected pins
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.209.6.89:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.48.87.93:received,164.130.1.59:received,52.101.83.62:received,10.75.128.132:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2E00EFBAB
X-Rspamd-Action: no action

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

The hardware denies any access from the U-Boot non-secure world to the
secure-protected pins. Hence, prevent any driver to configure such a pin.
Identify the secure pins with "NO ACCESS" through the 'pinmux status -a'
command.
Use a driver data structure to identify which hardware versions support
this feature.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/pinctrl/pinctrl_stm32.c | 83 +++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index fbf0271f08a..1758f9a909c 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -11,6 +11,7 @@
 #include <malloc.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <dm/lists.h>
 #include <dm/pinctrl.h>
@@ -27,6 +28,7 @@
 #define PUPD_MASK			3
 #define OTYPE_MSK			1
 #define AFR_MASK			0xF
+#define SECCFG_MSK			1
 
 struct stm32_pinctrl_priv {
 	struct hwspinlock hws;
@@ -39,7 +41,12 @@ struct stm32_gpio_bank {
 	struct list_head list;
 };
 
+struct stm32_pinctrl_data {
+	bool secure_control;
+};
+
 #ifndef CONFIG_XPL_BUILD
+static int stm32_pinctrl_get_access(struct udevice *gpio_dev, unsigned int gpio_idx);
 
 static char pin_name[PINNAME_SIZE];
 static const char * const pinmux_mode[GPIOF_COUNT] = {
@@ -216,6 +223,12 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 	if (!gpio_dev)
 		return -ENODEV;
 
+	/* Check access protection */
+	if (stm32_pinctrl_get_access(gpio_dev, gpio_idx)) {
+		snprintf(buf, size, "NO ACCESS");
+		return 0;
+	}
+
 	mode = gpio_get_raw_function(gpio_dev, gpio_idx, &label);
 	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
 		selector, gpio_idx, mode);
@@ -252,6 +265,20 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 
 #endif
 
+static int stm32_pinctrl_get_access(struct udevice *gpio_dev, unsigned int gpio_idx)
+{
+	struct stm32_gpio_priv *priv = dev_get_priv(gpio_dev);
+	struct stm32_gpio_regs *regs = priv->regs;
+	ulong drv_data = dev_get_driver_data(gpio_dev);
+
+	/* Deny request access if IO is secured */
+	if ((drv_data & STM32_GPIO_FLAG_SEC_CTRL) &&
+	    ((readl(&regs->seccfgr) >> gpio_idx) & SECCFG_MSK))
+		return -EACCES;
+
+	return 0;
+}
+
 static int stm32_pinctrl_probe(struct udevice *dev)
 {
 	struct stm32_pinctrl_priv *priv = dev_get_priv(dev);
@@ -279,6 +306,14 @@ static int stm32_gpio_config(ofnode node,
 	int ret;
 	u32 index;
 
+	/* Check access protection */
+	ret = stm32_pinctrl_get_access(desc->dev, desc->offset);
+	if (ret) {
+		dev_err(desc->dev, "Failed to get secure IO %s %d @ %p\n",
+			uc_priv->bank_name, desc->offset, regs);
+		return ret;
+	}
+
 	if (!ctl || ctl->af > 15 || ctl->mode > 3 || ctl->otype > 1 ||
 	    ctl->pupd > 2 || ctl->speed > 3)
 		return -EINVAL;
@@ -414,8 +449,25 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 {
 	ofnode node;
 	const char *name;
+	struct driver *drv;
+	const struct stm32_pinctrl_data *drv_data;
+	ulong gpio_data = 0;
 	int ret;
 
+	drv = lists_driver_lookup_name("gpio_stm32");
+	if (!drv) {
+		debug("Cannot find driver 'gpio_stm32'\n");
+		return -ENOENT;
+	}
+
+	drv_data = (const struct stm32_pinctrl_data *)dev_get_driver_data(dev);
+	if (!drv_data) {
+		debug("Cannot find driver data\n");
+		return -EINVAL;
+	}
+	if (drv_data->secure_control)
+		gpio_data = STM32_GPIO_FLAG_SEC_CTRL;
+
 	dev_for_each_subnode(node, dev) {
 		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
 
@@ -431,8 +483,7 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 			return -EINVAL;
 
 		/* Bind each gpio node */
-		ret = device_bind_driver_to_node(dev, "gpio_stm32",
-						 name, node, NULL);
+		ret = device_bind_with_driver_data(dev, drv, name, gpio_data, node, NULL);
 		if (ret)
 			return ret;
 
@@ -495,17 +546,25 @@ static struct pinctrl_ops stm32_pinctrl_ops = {
 #endif
 };
 
+static const struct stm32_pinctrl_data stm32_pinctrl_no_sec = {
+	.secure_control = false,
+};
+
+static const struct stm32_pinctrl_data stm32_pinctrl_with_sec = {
+	.secure_control = true,
+};
+
 static const struct udevice_id stm32_pinctrl_ids[] = {
-	{ .compatible = "st,stm32f429-pinctrl" },
-	{ .compatible = "st,stm32f469-pinctrl" },
-	{ .compatible = "st,stm32f746-pinctrl" },
-	{ .compatible = "st,stm32f769-pinctrl" },
-	{ .compatible = "st,stm32h743-pinctrl" },
-	{ .compatible = "st,stm32mp157-pinctrl" },
-	{ .compatible = "st,stm32mp157-z-pinctrl" },
-	{ .compatible = "st,stm32mp135-pinctrl" },
-	{ .compatible = "st,stm32mp257-pinctrl" },
-	{ .compatible = "st,stm32mp257-z-pinctrl" },
+	{ .compatible = "st,stm32f429-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32f469-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32f746-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32f769-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32h743-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32mp157-pinctrl",   .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32mp157-z-pinctrl", .data = (ulong)&stm32_pinctrl_no_sec },
+	{ .compatible = "st,stm32mp135-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
+	{ .compatible = "st,stm32mp257-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
+	{ .compatible = "st,stm32mp257-z-pinctrl", .data = (ulong)&stm32_pinctrl_with_sec },
 	{ }
 };
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
