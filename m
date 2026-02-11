Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKVVOAGTjGlQrAAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Feb 2026 15:32:33 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF681253FA
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Feb 2026 15:32:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17924C87ECE;
	Wed, 11 Feb 2026 14:32:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC853C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 14:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJjsGYefsqjJmc+v/WE423ihq0XsjHuWqg5SnKAzZ6ceuHD/nfcb2bJ958mt8xQbXk3+Jutu9Zw1jH/xcEml8l1zEr2vB75rjDNrWKJRBw0XKeO8E9oCnKP6NHUrK4lfHBwz5kaaemmj5/ziS1FedRPnHhgMUf8CM8zLQvP6wmy4aeHYcaJQc+pdNgIc+oRhAAHnb+h+PpOsiNEdGHCzJhPttkzw76qlyetAIITqmfftohW7bSS2OqaPH5ukVXySqDK4C+CKFtFWLvAtj3WW6g2aXyaiA31HK7uwXyYv/eiMUBUOJGN/LQ0ZD7UpBi4PcgrOkrmxUkOp2F1G0S88kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XWhM/7afu5JdQdBXU8z3K+lvVJY8wb/XbPgd3o8xpI=;
 b=Gf8xrufLV0NLmHe540SBsropk9TLUj+Ti6K+VzK9QfPzNjNWfN67NvfSrmOgsZGyEEcdoc3PrC0lohRGODhWqnB6c9xBbv0cIYIHb1XOOkrmLC2vso5gIeqvXZxqlkRS02YP8BWCDRtm2ZDuCcKnggMBy/UWgbJ+2LAdhSPq/FL1bqKhcD4qE7Z1OuQpam3Lle7c7KCR7d25cG8k3FoH4RBkIIFtkshL3pnlRPQ8DPJFv5QhccrHC3jr8TV/IWiBXz1Nb7eg7LP/O6E0PjEID2RyXdZI+NuX1Koj3/ZOaqBl+CxkfAphAtClaWaWgHp6L7cvOcHloCCXkcvAOmli3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XWhM/7afu5JdQdBXU8z3K+lvVJY8wb/XbPgd3o8xpI=;
 b=ohERJwyuhYZAXYvBFaQQeG6yfEV3tTbOlUlIij/fQGoJhv9OcZ6y1HKhsbtEUKYEAXCBY9EDLw9P+9nAGTOal9wWREPrwB2m8SESXecXBztJwQ0nwVDaChUTsBV4e+nYqvJQguE4jqPv9zFQ/1N7XuCXhZqe0MOHWCU/TFiU0UNTMjiPZR04wNzxXpz339bAvFVhJnwWK2JmA0ckdipNnUJSBZIlIF2xLr9nNQfZKNH96CoiFr2oz17X3vn/gfFBHPqxHmgNO0cUWn0uJZHu0ZBoxI8Cehhn7ZTZ3KB8um3J9glQXyBd5BZ9QbW4peM56aSljLema26mST0ZSHxTbQ==
Received: from DUZPR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::13) by AM0PR10MB3684.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:32:29 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::1a) by DUZPR01CA0114.outlook.office365.com
 (2603:10a6:10:4bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 14:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 14:32:29 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 15:34:11 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 15:32:28 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 11 Feb 2026 15:32:23 +0100
MIME-Version: 1.0
Message-ID: <20260211-upstream_update_cmd_stboard-v1-2-63fd9b767bcc@foss.st.com>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
In-Reply-To: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|AM0PR10MB3684:EE_
X-MS-Office365-Filtering-Correlation-Id: 747c6cc3-2663-4289-c1c4-08de697a62d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDhEMUIwb0hiSmdtbWVRYWVvRWhrdHVMS3V0M3BYZ09raDk2UGtzbmw4OXFB?=
 =?utf-8?B?akk1MzJoNlNVWnZzNmIvSENwNDB4Q21rVS9uOTJ5K1hiN1krNWV2Q1dHUndh?=
 =?utf-8?B?c1Jsc2FDdWFvSWRRa3FHb0lRZVBPL00wbFhaVzZoejZGQldtbUk1OXFWNlRL?=
 =?utf-8?B?SC9adUdTOEFZRklBSUgzRXpUVUszcW9qcS80TTdaMEdLWGkwNDk0UHQ1dmZM?=
 =?utf-8?B?VGwxWWNoQmFUN0lLRE9tV3MyVnVZaTBCUHBFbG8zN0dqdDFDeEQ0ZGVYRWZi?=
 =?utf-8?B?eXpZYXhQK0ZnaHFVK1FQZ0Q3MzZTVVVpeWN0aldtdG8vK080SmYrNS9rM2lx?=
 =?utf-8?B?a0ZuL1NTYjZrMTloUGhRZVBsRlAxSWNoLzIzMTNjamtWSVNyNnFldmZXbmJ4?=
 =?utf-8?B?NHRzSGw3c21KbnlwQ044cENWNitSKzl1Qm1rcE9Ua1N5K29qV0NUTm93UGtW?=
 =?utf-8?B?VFpwNXlSc0h0cCtzZndYS1pjbU5XZjlYVkNPZVNqdTAxSzBQOXhSaWdhelo4?=
 =?utf-8?B?a25tdVhleUJwbVdRU1pCMzRWZjNOUlUrUW16aUZmdjI3OE9Sc2lrQ3o5WUo3?=
 =?utf-8?B?dUVSdWQ3TFFkbDJlRTQwbDlVQ09BNmhud2xVOGhiUzB0bUVvUUZqV1VOQndL?=
 =?utf-8?B?VGVmZ2JzbEJBY2JmQlRLSVB6LzZxbjFOQWVLcWsrTnFIOUorVjhhazZaMC8w?=
 =?utf-8?B?cG01SE1QRGZHQW1wb3JneE5GZHZXV1RicnFkNjA4bURBdDZFbVRiUkorYmZS?=
 =?utf-8?B?Rk80RDNEYmhZZ3k4RkZzbjBwRUxlcmFMTXR5VXhzaGVpanl1cFlHMmRTa3dN?=
 =?utf-8?B?S1FTT0lZK3dXYkRoc3Z2VjBJTXVpMURHdXlSWCtodS9ObmIxenE3TWdMdHFF?=
 =?utf-8?B?UEhhMHlBejZpcnA3MWlhZ09DZWtBR09UK0hOSDlCZEtBSmZyaWlQNlVFcTZh?=
 =?utf-8?B?czlRS29tYnhoWE44SVBEV0p3cVlKZ2tUNkMrVnRyOERFV2tUY0tYTnI2QUxH?=
 =?utf-8?B?SFlJKzFnODNpUWljaFhKM3dMT0UzYzZsV1NOQm1nbFZacTFJL0o0MDVSckVP?=
 =?utf-8?B?Z3paY0l3SE5MT05Yd1FOcDI3YXVON3RnS3FyU2RabHVQRkhoOHIzL1B3ejhl?=
 =?utf-8?B?bTNKVFpuYm5DVEdaM0ExSVpJVi9KeW1laU84Ykp5SkVWVUs5eVRZYlRjTTZR?=
 =?utf-8?B?eGdGdFBKdWg3RlllUTY4WHIyYmt3VUlRQkpVbVRVU1pFbjlFSllBQUZFRE5Q?=
 =?utf-8?B?a2VFaWtIeWI2b0ZpSWJmZ3IrS0ZOcENoQysrUHBhcmxJT3VHZDBRczNGUVZF?=
 =?utf-8?B?dEsvTmNRNVZ5aXZsOVFmTVRYb2ppc0EwK2NUby8xdndyaVdVTXdnR0hPV2li?=
 =?utf-8?B?RmVjQ2wrZUhmRGljSE8yVklpMWw5K29WRXh3bit3Y09ERFFoNnpmcmpaY3B1?=
 =?utf-8?B?QytqVmN5bXc5UldvVHhZK0U4WTJLaUV4TWJ2anNyQjJuWGlBY3VpdzdIS0RI?=
 =?utf-8?B?UmJ1VC9xK0NRQWl3alNGNGd0NmJhdzZqTnVUeThEbWVaa3krQWRZRlBEMFk4?=
 =?utf-8?B?Z2Y1R2t6aXRVNTV4N2xsUVBZRDl6bFVHUHlQL0Z2VTExOXl3KzVSUjZlaEJF?=
 =?utf-8?B?eEdnVm5jUlFEdUoxQkdkVGxyTG1WYTg1ZEVtUXJFam9PYXlPSDIzeVhKMFgz?=
 =?utf-8?B?UUtuWHAxMVJjMkMvOU5ROWdKVGpaajBJTEU4U2oydVdCQUVZckM0V09xZHY1?=
 =?utf-8?B?TkJ2dkFrcjIvRFh2bWE4cVAyMEdRTVdNK2FtQ2VabmVnWVFicGQvZWI3cTBL?=
 =?utf-8?B?NVZQU1o2QldaTEtOUStlUTlNQWlsak96WEJwdkcraXdzd0EwamRnb2szRXU3?=
 =?utf-8?B?WitERUkyQlY3Zkd0bnlxd3crMElBRUVXYW1nbDh1QWtwcTA0dDl4NXYxTTVX?=
 =?utf-8?B?cVJ6dXRoQU1CdGRRZk42aVh2OFppZ1J4TFIyVmJTNVUvS0w5SXR4NmFYOTBu?=
 =?utf-8?B?Zk5RZjZ2bnBpZ1hxMzhOMmhRMVBGL005VXIyckJ0SlpEdDBQaXhvaVRJWmVz?=
 =?utf-8?B?NlJjdnNGUmUyTzlrZjJDQmllakdZWU1xMGNBWW1GeC9FZFlKZWJEMFlneDhZ?=
 =?utf-8?B?dk1OOXdZMElkSUFMUEVqSUVLQ1ZYZk9Mc1diWkxUaGJXUFJKejdjbXBOdm4w?=
 =?utf-8?B?S3l4eTJ5U0YyOVhOR2JlL2F3L01qZ0NEWENtUmxnbTJ3dXlmNGVDL1gvbDc3?=
 =?utf-8?B?aHFLZ21UUk0wTkM3NGpZUkJlOEhRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yYL2hEPxgY5ki5KeAiOzMINYUhJ3UvQMQDsK/0IFTECr+fCXv4+WVR28O2Sov5zII8Npcq5JDtTrfC4DBguxr+9KzKJvRhMI8YFcF9Clwf8vzz/eOjgrZlOjuQfhvJ1A2ZdMQm/Cu0/OGVr/fm87ZggFYR6w6gOXIdjSi7SzMzDUy2f7n7G0XMhpmEKcdj/5RWJh1fNnL6j6RjG4EwDsSE/C3PCDWsA+qAoN2S+icnloqWfwEPkCiQoI9AI/HT6eV/nd67z4BX+ojPAqWWVV7h+REk5HAPCJFYzKaBKQzgwAqVxCIuUS+a7j4LwMRmVcGcVA7cv1UjZSsv0eaG7P35gR2q9uWg9eHbBTmoUeEsMYXzfMMIPQZVo2nnFPteerEZUByS7JQiyg5enIXo8+122K2z+epxRtL3AvYo1NvyNf1P16y/+9ppRn4yaY+c6Z
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:32:29.6789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 747c6cc3-2663-4289-c1c4-08de697a62d0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3684
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/2] board: st: common: add
 uclass_get_device_by_driver()'s return value check
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AF681253FA
X-Rspamd-Action: no action

class_get_device_by_driver()'s return value is not checked, in case of BSEC
driver is not probed, dev is not set and used just after as parameter of
misc_read() which leads to a Synchronous Abort.

Add uclass_get_device_by_driver()'s return value check to fix it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 board/st/common/cmd_stboard.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
index d77046499a0..58d9f205b92 100644
--- a/board/st/common/cmd_stboard.c
+++ b/board/st/common/cmd_stboard.c
@@ -92,6 +92,11 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
 					  DM_DRIVER_GET(stm32mp_bsec),
 					  &dev);
 
+	if (ret) {
+		puts("Can't get BSEC device\n");
+		return CMD_RET_FAILURE;
+	}
+
 	ret = misc_read(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
 			&otp, sizeof(otp));
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
