Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHa1LYkdg2nehwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:57 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C6E4673
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF97C87ECF;
	Wed,  4 Feb 2026 10:20:57 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1929C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA/DfBkZ/LwuxSf0Yo4Bl8JZHGIJ+bXmmYDMUfvS7quZFhTOdZ7wgR5jmTHgTaSeYv/jZ/3/Nm+udxWavmAOS+OPOZ/R2IvGbC+Art2pr0cB/HjYQ505d9UHjvS31PEb6KPhFuF5j9CN/AIngTpv1ezY/qMtfvzW0fyC0ux9IgptmG9POHduQJGwkx55HeRKy9Gbmd9BHctg72QWXAtrbn6Nvc+nvxjdiV9bb4GrIxrQ5LB3JelbSuCHPRMh5VumGspRIjI8zThTwwgWVXQO3C1tp/u3S2xwHjIBADBPoKm2lNwalqQtKRf2yVkyZ3JQWKM4EPEH6MCJLWinSxLYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ/ZWR+59wCTLbOUgmWFWl/4/PoSCrvQADgvGAf6j7o=;
 b=JNU35B2lr6kfD1SkIt6acfuMYZ7QT3Fl35neqj0HRm4I9sbyWGveWaeXKSqwx2TQBHzOJraTaQADn3ln61yZArp5eFqHKQ3Rd63q5oQxyQF15ygJ/navD2pxVQcrdurhHiJFOXdfggR24kLzAz6lgw5Q+mdzYQQykABK1b2lo7vSJOyTLo/jBiopNamxHg1UvzhI5S+P99M8EOvxNbPSCKgiBNgjCBAcapsxj99+o/Du+PieCbjKFY/u+Jcz2ikkwnc3yVkFvqYdNE11zbkPR7+5p1/x7bqRaGREvMJ5qcXZYm7V7hvwRLsSjvglwnPzw7PnpU80+pqAENrVFnfieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ/ZWR+59wCTLbOUgmWFWl/4/PoSCrvQADgvGAf6j7o=;
 b=fhNyCXx7ZQQKc4xnaq5Py8H0rswZUYIF08OOiYHr2xGozBGF23rm941haBOVCUS58alCu3iFk6aEcXN5LZneEayQSu1hNDbtMIDe0BecjIgJpu9F57BSHEk+z2+Zwc8HQb+sEmGJFhqaOUedPPsEAoGHCVWVMeqQm+l4oOL4qhVddp/61n9eA01wF2NgB395pK7UzLLu+nw/mufyg0QEh7hBm8sYIzTdqEQ9D5ZVYTFjOz/yoXhLpczdIhLqCUyMyXkku1SOhx/OCTL433hTwqVfvGqPdnsFyX7LZhWj1ySx4c/WitEyET3qRrmKKendhFV22EY5U/8KqvKvDrYiGg==
Received: from CWLP123CA0174.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::20)
 by DU4PR10MB9589.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:628::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:20:51 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::6d) by CWLP123CA0174.outlook.office365.com
 (2603:10a6:400:19b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 10:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:29 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:50 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:48 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-3-d95374395840@foss.st.com>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|DU4PR10MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 4075bc98-5071-4a79-e5a9-08de63d71247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0ZlWXNhVTFySHJiRnpkTGszUDlDcVk5R3NLUW9HR1JGb09QcGZQT2FiVzdR?=
 =?utf-8?B?amR4U09QeHVNZ1oxeUZUQkxKa0FjQWZvSVgwWlpvNG1WK2IxclZMek83d2xW?=
 =?utf-8?B?cStMam1vNVF1K01lK2NRaitwQUdLbGJqbkw1ZXp4Z1BWbE9EYXlxb051Q3Vz?=
 =?utf-8?B?cTFBNEJkeVBJeHZPL2FuNW5WUVczNkY0ekZnNWhqQVlFY2tsaktkaXNUTXV0?=
 =?utf-8?B?SUZ1cVU1Z0RtY1Y3b0o4ZlNNN3FjNklqOEhtUk5YSjJwNThXUVc3TlJPS2F2?=
 =?utf-8?B?TzhhSGlNdW5UemZpV2N3ZE1GYW9tK1llc0x6K2VYbVFBV2lXL0hycHlROVUr?=
 =?utf-8?B?UTl5SFdBK0E2Q0ZZdWZvR2ErRVc2RE83TXcrOG9PQUtGeWFJTGc4ZmRkNEVD?=
 =?utf-8?B?aDhPN2tEMVplYnNlUjRDSXhYaDRKcUEreUVUT2JCMExjM3ZWWGl4bFdIU0tT?=
 =?utf-8?B?NS9xRlB2U3ZPaExEMFN3UEJsNXRWRlR6NGRHSXk3TzdvSHpNRFNBVHJPZEow?=
 =?utf-8?B?RUxFQmRnVDNubjRSWTI5andGSWpKeWtRalBlSnVkSW1vWDhJTnJlVUVBQnJj?=
 =?utf-8?B?OENINGlSTUZ3b3BaKzFMUUZNVHdlVlRITFhady82T2JFZzE0aWtmM1FmWHNN?=
 =?utf-8?B?S2hZMXlCMmFUaGl4UHZhYzZmMmZDaEpjVXU1T05kWkRXdmdHV2tUckZ2VmRi?=
 =?utf-8?B?SnB0bENmU2gwODhPdFBCeEVJaWMvR3VIVHJiT09wdFpLM1N1R3dNK3NuNFk4?=
 =?utf-8?B?RmEzNElSQk9iL3kwblFibWhqL0VJT2JiVnJwQ3RLUW9NcW12WGlrK3cwWjZ3?=
 =?utf-8?B?NjRWQlZjaWNQSGdZdzFSaDl1a0M1VUI0T0JpeFdQT1pTRC9BWHZ5TXNMaHVB?=
 =?utf-8?B?eDNJY3NZQndjWkxvaWxjZmI1WW1zaGJzKzF1WEpVYWdyMTRwUSsxeVhEeUg0?=
 =?utf-8?B?ZU5xRWM3RjV1bXh3d0JvcGk3b3VDcWFJSEJ5OWt0K25sbkptdkdraEhHV2la?=
 =?utf-8?B?LzlCVldZdktxMytaK09PaENZdDFlcVlqTStIR3RkeEZRWGFEditKT2tERk0x?=
 =?utf-8?B?cWFLMDNKYnVycDhCOXR1bndWVkZCMlM1WTdXc2FNWHQ1QU5UbFJYUHBJdUp0?=
 =?utf-8?B?dVJyUGpjUXlyenJueHAxRENleVBxQzZ2Z0h6b3M1TUY5TnIvRXNsNU96eW9F?=
 =?utf-8?B?eVlKS1F0M2ZKaGgwaHVhU3FqcDFQM0pld2dJb1UxQ3FLRys0OTZiVUtDWDVh?=
 =?utf-8?B?S0U1QW1FN3M1azE5MnZZdGV2dzBlTlM1UjRDa1E2b2djbURON21KV0NBbXh3?=
 =?utf-8?B?dCtHQTM5cG5zQThEUGtta0hWQnhQVHdDMERDMjllS0xhZVE0UEJQbmVGOGFa?=
 =?utf-8?B?Mll5OWhKdTE1bkQ2ckFuTmt1eUMxTGNub2ZOVyt3bWNkdVVBQmkyQktKcmN3?=
 =?utf-8?B?R2gySHdLOFZHQzJsRUI5TW9zSUFqbVJDRlMwcXBuSUpwNSttbDNZWlg0UURN?=
 =?utf-8?B?aW90aXptVlBYTDIrelNTTVpxUXR3WGlvVTdINHJ2NjVocXQxV0liY1p4a3Js?=
 =?utf-8?B?ZzNmZlFlR2FTY28wVkx1T3doMFU5bm5wdEF0RjRPV2N1VytpSTFpMHpxZU5C?=
 =?utf-8?B?ODNMSXo2Y3E1Nks1SzNqVytuTllERHAzOG9FSXFGMXhCSHZvMDlYTzNSbVp4?=
 =?utf-8?B?MGprWnQ3a2dRa2dsRklEeVh2RGQzMmgvN1RzRURFd1ZLNWhWMEhBZVRtamFY?=
 =?utf-8?B?K2J5czRkYWJWVzJ0SXhVeDVpb1ZtaEUraGpLTE5venJEOHZ3clFUaFdmU1Vv?=
 =?utf-8?B?aWo3KzJkVTRrSGVSb3V4VDlqeVRwcUdGZmF3M3dZNmF3dEl3SjJpdGNabFBC?=
 =?utf-8?B?ZzNNMURkTnk3UGhBRGdHVHpjZmErN3JFQlhEb1h4S1k2T3NYcnZGRWhlYjFF?=
 =?utf-8?B?L0RReFZ3Q05qcjBteTE1OVpHWmNiNE9QZjdDU2VveEN1NDVnK3RScVNIUWQ4?=
 =?utf-8?B?cXJSQVBaTjBVUHM4UDN2WFVpU0hpUEMzd1N0a0tlYUZZeGdlOEd4NUZNR01a?=
 =?utf-8?B?cVh3aDVxeDQ4SlR6RExlaHRoaks2c3k2UmhicGxnc3IyQWwxZExiMEVmTWVj?=
 =?utf-8?B?OCtOb0R3eU5uVFcwM1lmWTl0T3Q2YTB5REdXZHNxWDg2ZjVIRGczeEJlV0Ny?=
 =?utf-8?B?UlJBUDZEeEdHUmliR01pRGI5K0xqZXhyTHVuRVVnWXRIN1g1MzBkOWw3eTc0?=
 =?utf-8?B?bDMvcnRJaVlVN216Z0pNZEhQa21RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Zlua/oSrAibDcJf1avd9gOLt4aPguWQ1/eCyIRlld50o3ehdYjhfonXLOQw5okLl+x6TBSpTG11kfD6sKVlUcJLsPiNqH/Ti2Gq80T6EEQ9JSY7xXCURleb4L5Jpz8Te0SqjZuNG7IA+9PfGrhCsZvw2ieRnG/G0iOyBbwUW9+8aHeiFhqdPZamH25+W0RcqbMBJ/kb22vjvt+88e/3F/2SlTBD8xca7ik78/rYdJIDD2RSGpw3FnVqdpm8KKssed7zGI4YwfKWGkOBD4uutDd2TPz7f2FekSBQkpH6oRO+kmeIXSpwi0qrxLa8pDyAiVyMLBohOi8T2es2ULuVjK6FSY/UuGKDn1t2gyS/J5cmijGykm6CYKhYVckv9irEzR52t/vR42GpUhJxeUlwXKWaDqEvs7908u4bhbUk+hxcAGZdX+tqPeoymtJexv0eD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:50.8112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4075bc98-5071-4a79-e5a9-08de63d71247
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9589
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/6] stm32mp: cmd_stm32key: add support of
 remoteproc firmware encryption key
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,st.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A40C6E4673
X-Rspamd-Action: no action

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

Add support of RPROC-FW-KEY for STM32MP25, STM32MP23 and STM32MP21.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index cd539a626d1..7a82152faf3 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -93,6 +93,13 @@ const struct stm32key stm32mp21_list[] = {
 		.start = 260,
 		.size = 8,
 	},
+	{
+		.name = "RPROC-FW-ENC-KEY",
+		.desc = "Encryption/Decryption Key for remote processor firmware",
+		.start = 332,
+		.size = 8,
+		.key_format = format2,
+	},
 	{
 		.name = "EDMK1-128b",
 		.desc = "Encryption/Decryption Master 128b Key for FSBLA or M",
@@ -141,6 +148,13 @@ const struct stm32key stm32mp2x_list[] = {
 		.start = 260,
 		.size = 8,
 	},
+	{
+		.name = "RPROC-FW-ENC-KEY",
+		.desc = "Encryption/Decryption Key for remote processor firmware",
+		.start = 336,
+		.size = 8,
+		.key_format = format2,
+	},
 	{
 		.name = "EDMK1",
 		.desc = "Encryption/Decryption Master Key for FSBLA or M",
@@ -284,7 +298,7 @@ static u32 format1(u32 value)
 	return __be32_to_cpu(value);
 }
 
-static u32 __maybe_unused format2(u32 value)
+static u32 format2(u32 value)
 {
 	return __le32_to_cpu(value);
 }

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
