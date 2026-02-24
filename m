Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LidFYZ+nWk/QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:33:42 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8851856F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:33:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2C96C8F286;
	Tue, 24 Feb 2026 10:33:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07521C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:33:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSmTp2+M5f5jIllIhV6+LT1iLEnsmAL9Xgu/f42VR3/OUTq5rHyE5Fn7HQBynBuRegIIkgaV4bn4Wey3DU5EF9eCHBQviNqXHv6EKocZHKgIzbDiBG2j+udWhLl/At7eaYVnqKPXtKPjlmSdDhUIIy0ULU52TGH/mULu53Wvxu1QHoH9ZwMX0zHF8MZafejP6lBmpWdOr/LMc1urUTCmvUFet1l2e1OOAwSXY54gKKiWYQhrpGkxl6VXVyM0ksEG8MavrxNsgTqIBvnnhMx9Q7Im/tbWGf5XWUVZHeHAQJdz1/m28Wn/8rTKzcA8X5EYbA5GcVTJTTGocMV1Y75rug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5AoJvqMQJgbgYprAHs+xE1ibdNCbGvQOfCCmvl90SI=;
 b=VWDG1X8kRQOhiZnFVQuWiWL6sycJzUHBlHspvbB0lzWSoiE9GfTzP5+0WOz7YysZLzT/Ka4NY4wam3MB3FJ62/AL+xtVGGkkJKNpUvUgLEUbn/4HOiFRIbHi7qvhWqGPFI+hM3hDShDs1ab92d6AfW8ml7+TySzkDDZi6HMkNwNzObweJp+dWFpQaEWN2spWe6Rwg3laQS2WvtGkR7jxB+qBX90KuOInBVmJUeY52S6fJtb1DtGihVRPTJrP8tdi0+ZJajYPFvH9GR5Tux9EqI7FOrAbqwDn0hGy3jVQU+wH/vdY1X80oJHrLa2YxZvLQT+cKNV5q84QAMkAmGdaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5AoJvqMQJgbgYprAHs+xE1ibdNCbGvQOfCCmvl90SI=;
 b=N2zjcn+S/jEBjCF5cwhFiQvIx8YeWbexqfCSvbMXwD5ixxlKaBfB5bl19f+P4PGQu8T6z8xT5QDQcr27Rk8UuQqsnny/KU8/NLwycwaXUMZ66KGOHgDrsgrIFb+woZRnQh9dFEX3e6CATjTghvvoELSn0py/io1TMlHD1EkE3VKamt6PNOY2/JejtpZAKYTccW/UPcMehOTy2gIYcWQPALQQhXsFRtpUBJ0jx9NkhhzMTOqg6F6bGSZOlcS/QxfpiKhuONQjefalRSm9Fgs4HwWbOj8pMV5prIE12mQhMemkZvPbdxyGTfbyZGR938F2LRvWO8TKcmd7QPqZhQPM0A==
Received: from CWXP123CA0016.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::28)
 by AM0PR10MB3188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:180::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 10:33:38 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:401:73:cafe::c3) by CWXP123CA0016.outlook.office365.com
 (2603:10a6:401:73::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:33:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:33:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:35:54 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:33:37 +0100
Message-ID: <6c1aa9d2-d869-413f-b51d-99d7ca230b04@foss.st.com>
Date: Tue, 24 Feb 2026 11:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
 <20260210-upstream_rifsc_update-v1-4-74c813fa4862@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260210-upstream_rifsc_update-v1-4-74c813fa4862@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|AM0PR10MB3188:EE_
X-MS-Office365-Filtering-Correlation-Id: 153c5947-c702-48d9-b850-08de73902c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WitjZ3dYU2toUnAvL0w0eG02NW80THRqcnBVRU9BVWdMZVVPRW8ycEIvTy9k?=
 =?utf-8?B?U29JL3g0Rkppd0JjeXNFY2dLbUZIYnZsZ21EZGR1Z1Z2c1FzU2QyRFVGNlJE?=
 =?utf-8?B?ZG9JK1BDK1hYVktEdFE0Q1BQY3V5TEdLNVZNOHJyMGU0TTFoME9jT1B5dFhh?=
 =?utf-8?B?ZEdrY0VRQ1pnTHlOeW9BMHdvQ2FVRUwra0lLSDhDMTJiWjFzMDRqMjNrOGZz?=
 =?utf-8?B?TCtXYVRJLzRJYi9HZlVNb1lRMzY2Yk9pSTJDc3c0Y0ZiNm8vamlZcjhtVEpJ?=
 =?utf-8?B?SjNsaDlqZnZ3NUtKM25hRXEwdENxWmxFVnFGT0JyNW9KNUFZNU1uN2kwSHhQ?=
 =?utf-8?B?MmdmSysxOTNuR0J2aEN5bmNNcTBBdVQ4cGRvQm9JcjdxcEFrbnltZ01OQ2Fh?=
 =?utf-8?B?ZU9YOXgva3JyOWpBcmkvTDlCdkJOQVJyUTJ0b2tFNlRESmhoK0FHZk16UUtL?=
 =?utf-8?B?RmVhQjAwZ1AwNDRnVUZ5eUFieDBFTkw4VzVNNW1tenBUaE1wS3dMY01jMXRQ?=
 =?utf-8?B?WHRSMUNYcXhSeGhRcjVEcGpxdkM2bzJ0SVpoS2xKUEFEZFRSdVZUTHlsVGhQ?=
 =?utf-8?B?d1JZL0lNNDl6a1V2QXEvU1ArNnEwOXYyMlNGdWNlQ20xRk5xUlo1Wm8xOHRR?=
 =?utf-8?B?dHZ3U0p5WHRYZ3U2Qkg4dlJWS1pwLzRzeDM0Z2xBY3RKb1RsK0tQZnphK1Yx?=
 =?utf-8?B?MFpGQ3dUKzQyZ2RSeis0cUhZOUJBbUFOc3BTcy9kcmhVNXZFbDJkYXZCbW1o?=
 =?utf-8?B?ck5RWmhPN0dEZnRFb1hIcXdmd3JialhqbmFCWDIwcDk5aEVudWR1RkUrKzdP?=
 =?utf-8?B?RXVqSW1HNS9XcXhKZXpYNzd5S29LNXFRMlpUM1FzM3NLNm9TeEpXSkoxbStE?=
 =?utf-8?B?Q0VmOWVaZUJiWUlhYWRhdnRDV1RRTGlpM3dtdEQxWVFaQmxOdEdqdzdKOTZr?=
 =?utf-8?B?Y0dJVVVySkZieHl6cG9YeGxuYklURXI3Sm0yMml1WEJuK2NnUlhVS1pnZjZT?=
 =?utf-8?B?Q25EcXNLZFJXQys5WFc3cDZWbTVkL0h3aHVLM0RZRHVaMU5ZZkM1eTUraDdB?=
 =?utf-8?B?MUkrTWlDbkdaZDVHN0c0KzBOQ0Vra0VCU1FTVkRSdVhHbjNSUklhMTVWWjFo?=
 =?utf-8?B?TVlDeWMrUDFDRjZKVmRaR1pGWDVDS2w4eDFGbHdIejJxU0c1RHJ3WEt6WDVR?=
 =?utf-8?B?ZHRLc0R0Q0JiVUd3OE1zRnJXSVExOXVSdWx0WGhlUGJHaWNmam1mcUQyMjlQ?=
 =?utf-8?B?aUlIZUxFV1QrVWVmaXR4VmhhemJqYWJTSmtUSnVYSzQrTHNCRVV5Rldwc2Qy?=
 =?utf-8?B?cWI4NFFSV3pJQTIvNUFUR3U2Y01wdUZGVFRWR2pyVzhUSVdiQ2Ribk96MnY2?=
 =?utf-8?B?cUNFM1ZidzhmUzhaeEtoZ2pWUTJnZElqSGVDcGVuY1hiVlNJTVJpdG5wTkF5?=
 =?utf-8?B?TldYNjg2SHdtUTVSN3llUDVrZHhWbERHQlhuSjFWK29rOFhjdEZjNm5tMjZC?=
 =?utf-8?B?blhLYm9PeUhBNFpEN3E1a2oyZkx4QllzbFN1Q24vZ09JMEZQbXN6cXFKWmZt?=
 =?utf-8?B?M2ZhSDlkM2Z2UVo2VHcvL3poUVhXRm1JOXFRYmNQR3k5anZxNlUxNWFmSWZG?=
 =?utf-8?B?ZDlQWTRpaXAxTm1OSUU2NCtLY2dmZXVTZ2tnK1R1TVhRdDlCbWI1R1AwMGQz?=
 =?utf-8?B?T00zcVFNRXhuS1JzZVhmbHVoTG5BN0pYOTMvUjh6dlJzV0M0TUJiV1FRK0lq?=
 =?utf-8?B?R1ZMaWFGUmJXenczakJTTElPNWlpY0NIeFVNQVFTUk5XUjFiODE3OEoycmlr?=
 =?utf-8?B?UmlGZmJza2YyL0ExWDN4YVdKaUQySGk1aWNldy8xMEFJU3llVUlGRUJNaVdh?=
 =?utf-8?B?Nk5sNWJpamU5NXltdXVkT1R5U2ZFdFQ5ZVRKMnVWZzB4MWJRdXliUjNVdkli?=
 =?utf-8?B?OFpoVnlNcFdHcHNObHVuN1R0R1FZYUdkYkJ4QVhaSDVuTUtCRkExZFZ3OThm?=
 =?utf-8?B?U0U3eHhhNmVaUWFqNjhJSDNVbFRmalIvT3B2OTdiUHhOL0pnRi9rUFE5d24v?=
 =?utf-8?B?cXJUNHhaMHlXRDRuVjMwbUs5Y0RjNWVzRi91a1lOL1h4SU5RTmJYWERsV09l?=
 =?utf-8?B?cndPNVN6R25jLytVSE9EbHU4Tk41YW9XRXZMMTE2Wnp6M2RJVVZianJYeDFH?=
 =?utf-8?B?ek55elBuV3E2blBuakdoRVVUZ0N6U2F3ek9DQnA4VkI4dnZQeGtRRmgwTXF4?=
 =?utf-8?B?OVBZclV6Y0FvbktvbS9rSEoyVUNBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PLEQzGTD0oDW1YDgfeKec8h9umG9LZAPVioVCDcUXU0cdNX0ykFWzn+KlcMwCtFFlQezQDpmm09iO20KFFENHx2JSkBVrXKDKvTCRPM27Ve0Mp7E1ag/2mYoMg1DQLDc7PjmdfCMyNbOUsVjVKbXnrl+92dxmagLU2FSx+ifoG8BAjyblaX7PPTY5RWHstEqAbHXmfBgObVkR7vdnghW8vzE9N9y7ZZKyZ+8xyL0mDVCmrgEJlvkV+H39GfkxElfTB+lPpHomGmBYG5e7TtQ9vw8oPf23NGO7Fc71BmROZDKn5GqmiKGAFahLML36E6ltmoiRGSh2nUHbPCXUwxcH0p55nAXbGY7uIagg9VmKG0eUHUkcXjW2HBEjiAKvV5DL990RaX2vEhmZAAo1N9+FB9uahlleIqgHuSNQw2WM5yHI93sGjK2t951k8CgfAYU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:33:38.3917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 153c5947-c702-48d9-b850-08de73902c0d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3188
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: stm32mp: Check secure state first
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.814];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC8851856F7
X-Rspamd-Action: no action

Hi,

On 2/10/26 11:26, Patrice Chotard wrote:
> From: Gatien Chevallier <gatien.chevallier@foss.st.com>
>
> Secure state must be checked before handling semaphores,
> otherwise it can cause an IAC.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp2/rifsc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> index 0ef086bb956..9db8b9efc64 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> @@ -141,6 +141,12 @@ static int rifsc_check_access(void *base, u32 id)
>   	cid_reg_value = readl(base + RIFSC_RISC_PER0_CIDCFGR(id));
>   	sem_reg_value = readl(base + RIFSC_RISC_PER0_SEMCR(id));
>   
> +	/* Check security configuration */
> +	if (sec_reg_value & BIT(reg_offset)) {
> +		log_debug("Invalid security configuration for peripheral %d\n", id);
> +		return -EACCES;
> +	}
> +
>   	/* Skip cid check if CID filtering isn't enabled */
>   	if (!(cid_reg_value & CIDCFGR_CFEN))
>   		goto skip_cid_check;
> @@ -162,12 +168,6 @@ static int rifsc_check_access(void *base, u32 id)
>   	}
>   
>   skip_cid_check:
> -	/* Check security configuration */
> -	if (sec_reg_value & BIT(reg_offset)) {
> -		log_debug("Invalid security configuration for peripheral %d\n", id);
> -		return -EACCES;
> -	}
> -
>   	return 0;
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
