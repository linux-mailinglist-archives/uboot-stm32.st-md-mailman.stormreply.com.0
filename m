Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBIND3Mcg2l/hwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:19 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11653E45C1
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF986C87ECB;
	Wed,  4 Feb 2026 10:16:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 845DFC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjAFJc7U99cmjIqPrB4Jsv0lgs28GLPBuCp5ENA+vA3ssp6vMA7jTvFmgMas79Z2i1M0htpNs/upXH2G1mTibfKSg+HHKpL1pemCYLdwLbN6HeqAejwqKAhX35sejdQVJcnmq24NEk3Uldv+ofrY25qvYjQ2BBH9jrbcH6TZpj+aoRlDoCFPrcjwkc4G4WiMn6qcG4DJnZCwpoXDyTw6svVD+3r8NGXjO3AG98Q19Qpblq69d9WweDr6vM6AoKHRtBuYWC121yW7VAHR6/atea0+c5LLEbFFVDJ1rgsJLg6M0EvI59TNPAFpgTHVInK60FMU2B6N2qA716w6e1S02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGH/lTOp36TV1Yar1acNFgPWM4gMDYmy0fRWJHzkfq8=;
 b=DsnA0LMQnxBV8EI+sLePGmeiMH7FzT7n4SPRevdoKtPPvhQHN7FMJDgexm4jywOOvVcpILJgRDh1GXDRgmpwnNhF9DhpHiw8a+SGOq4JDJ6K7dkJQZjCdn4W9NNWDQ6hWFEKe0eGzkKGnricb/z0vNl9ejT4lhpeqkri4+OXPNsMW+JTMXmxCuqK7GeCCd/ijHxCmb1uuy0kR1fVVaT2CYzHDRI32c3u+fSSsf8XdT3IvAKEPDBcE3zuFQzz8nIHceoWywPQoDGYXYiPVGzLG9OzbhPKxc6B6YTIT/Kw9KPOFW8vMsM00zvLDchL9+PgeyTffFgl8LIs3FxqGDyBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGH/lTOp36TV1Yar1acNFgPWM4gMDYmy0fRWJHzkfq8=;
 b=Rk8i+l1aS1LnqDvD95UPrWvlp4xtoi22Fv7Da6lFtuOxcuGHgavyt9m45IAFdQU9dm6/dFAhFz+h+nCZmbQUDH/Kf950GAmKYsbPnD5mAVoDzviUBafZYXQ6o7EmPc7pHrsxBqj+graeFaGZjEKZFQn2gDNJNziWbNpVhn10sZzyJ5G5FVro/vHu6l3h0mmDqj7DI6p56rPPXKtCmrxn/D3KWIEm/pCCVIMSjVvhhDRh3i+D+nyfnZqLRqlfMihLuKts+J20xQrPX0v1HDIMiea6HWu7noed+Q4EGjjc9W7m4eshCt2eUPp8QcFHEocRMBPqZEpV1mOPXGyBZ3Ji6g==
Received: from AS4P190CA0055.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::19)
 by DB9PR10MB5528.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 10:16:11 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::29) by AS4P190CA0055.outlook.office365.com
 (2603:10a6:20b:656::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 10:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:16:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:17:47 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:16:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:16:05 +0100
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGUcg2kC/42QwW7DIBBEf8XiXCLA2DE+9T+qCC2wNBxsE8BW2
 8j/XpxU6qGXHmd3NW9m7yRjCpjJ2NxJwi3ksMxViJeG2CvM70iDq5oIJnomWEvXmEtCmLQHW5Y
 UvlDD7PQaHRTUdeN0cJZaZjs52M5wNZBqFhP68PEAvV2eOuFtrbzyHP7iKv0PDJzTuUytmKLgO
 q8xLqlQZhg6dpbOgRo3fnAMZKR2maZQxqbvB8W9N1wqwbDtwHjwFvCsOutlz6TDeiI8ORJdQ65
 9Ph+fqF5HpJ8c8r+lN04Z9ZID61srBqNe/ZLzKZdTTUQu+75/A3EohvhwAQAA
X-Change-ID: 20260203-upstream_factorize_and_update_read_idc-c0c548c5b198
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|DB9PR10MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f47e3e-04f8-4a81-689d-08de63d66b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkdDU1RseEpXSWZkeFdIWVZMdFZSRThnQ01zMGZuMGY4cUswcyt5b3dkemxy?=
 =?utf-8?B?azI1SXVBbXNYZzdlOFlXeWoxWUhlaTZzSURzV3N0TzM3Wi9TZ29pUnZQYTVK?=
 =?utf-8?B?R0lLN1hiSlN6V1JoOWttZ1pLREhDYWxuRElsSGs5Q0xvdFRIcFd5WVdaV21t?=
 =?utf-8?B?SWJVNm1jVTFFUWpEZkdiUTB2cVdvbGJ0dGFkWnFTc0ZTeDY2cVFQOUVnVWJM?=
 =?utf-8?B?eCtxZDhxMis0ajdMbHhCZ2pRbVY1cCtxMktDQWgvV21TM0JNNzdHMnlkVjMz?=
 =?utf-8?B?cWkvNjl0cklEQzlvMXl5bmdoSEgvYjlUcjZZWVJCbzRnWjE4Z1Ezb3pvNUUy?=
 =?utf-8?B?SkY3NmJUbXN2RkZudFdmVmtqRVl2NjFwMDhmNzkxREtLbXdwRUtESkdRUlhT?=
 =?utf-8?B?VTNyVnc3T000c3lReUUwQytIZEdUR0tkcFF2OFNKNTBXWm16N3pMbHc1OERr?=
 =?utf-8?B?QmhkQnJCdThKckw2ZThTWHhoNEpOd252Rnh1OE1BMDhaUzQ0NGJYem9nSnYz?=
 =?utf-8?B?OUcyb3BKdlN3QVBRclJzc2swMDdTZlV0VjlCcmxEaG1BeHpoK2Uyak9tSEp4?=
 =?utf-8?B?TUtBdGh5Q2hLbzl1QmVwWDRVdkRWeU5MZ2llR0V5YTVRdlpRSnYrQ0l5Yjc3?=
 =?utf-8?B?bTRHdmZwNjVLSG5EZWRldFN0NkZnOHplOENjdE5sdEx0a2hIV01tWE9RRVYw?=
 =?utf-8?B?azFQWndVSWNxSGRpR2Ywb0tFYTd2WFZDOUhNNWx6NG51T28xVWVBU1FRbU5X?=
 =?utf-8?B?RjJ2ZzlOSStNa3lpdW1NaFh4Wks0ZzhYZ1NYNk9nN0laZWFZWVVxdGszcVVp?=
 =?utf-8?B?SjNCK3l3UzYzYjFjdCtRWHkrYktkbDBkNk5waXlKRXlsSXVSUzF0ajY4THdF?=
 =?utf-8?B?MnUwUmNsZkZ4amRPazFCQ0g0VzRVNlJueTUyOW9ubmw5YUxET0RaY3hGbU04?=
 =?utf-8?B?MjJCRVdtTTlqN3h1YUV2Q1Nlcjk2Z2czYnB2MXpOU1NkdGMrU3dXaTNyTVBX?=
 =?utf-8?B?ZFN4Umk0RjBTUEM3cG5FcGl6TTRJenByZEFuZk5HVzdWMDRJeHpBRTNGaHBq?=
 =?utf-8?B?b0EyVFlpcnczdktXdTdBZGRERDd1a2NFS2lncHU1L1l2VEpLZHZOWHc3aHpO?=
 =?utf-8?B?M3FwMFVIcVdvRUdlQ0hoaytaUzRJZnZ0UHF0NmdiOUMydmQ5cDRYNGo1TzZG?=
 =?utf-8?B?TytSWXNYWlFDck9QU2xHWEJSRWN0ZUxUQ1BUMnF5QVloMVh0ckR0OWlJeWtn?=
 =?utf-8?B?OEVRbUlRM0pGejdvVEY3dzZHMzBCeWtJSkM2UmZoZG84UEV1RVBnWXZFSkhS?=
 =?utf-8?B?Y25oUENHWVJaU0ZYM3orY2VPaWUzazJrbFJCZ3Z4YmRVTVZpYWdiTktUUHl6?=
 =?utf-8?B?blNHZGN6d1NZcHYrbjBSTDBmNm5iYkpjcUd3dkJFeFBQUUJ3ZW9xNXFaVzY0?=
 =?utf-8?B?TjZ6WUEyQzBUeVFIQ3NlT3RmQ0tFOGp4L1Q0bERyVy8rRFpkN0JDSjNjb0I0?=
 =?utf-8?B?M2hLS3NnNytyVnJ2bUE3Zk82WW9jdFR5NWMwb1hEYjZnRTFYWGdmenZpZERY?=
 =?utf-8?B?MkV6dWlwd0JmQWo2VC9lbXRSWHhYU01TQ042ZlQ1S01Cemx4SEJxak11dHZM?=
 =?utf-8?B?Y1p6V0Iza3FQU1pTSDU3RkUxWnFpbUlVTFgrckxNZnNOL3U0R0M5UzYwRVA1?=
 =?utf-8?B?OU1Cd3RIQjNmTmdSQTJ5Um15QmtSYWhvYUN3RktiL3RKbHN1Y0cvU1IyK1Yw?=
 =?utf-8?B?eDRUZ0JhOGluRVhMU1hVcDhkMTBURGVpWTAydE01Z3JKRzlqM3AwSXIwbTBE?=
 =?utf-8?B?MkFwZDhwSEZFa3dHRHQvZTlTM3UrU1ZISW5kYWQ1d2lxOGgySUFPb2NjUWRj?=
 =?utf-8?B?dmhKS0xJRXEzb3BpZHl2aXZDU0RIZHJsRStPTytrT3NsMG0wdzlvaVlmVmFX?=
 =?utf-8?B?cDk5V0k3NzNxRk5zOGZRNXZiOGpta2crRjBmYURKVjZRRitvMjB6Tk1YblFN?=
 =?utf-8?B?aDJxS21BQ0dndE5lMDhpeWF2M2syZ0RxWXhYOENJRUtYU2NsdWdLeWhBSUZk?=
 =?utf-8?B?RnRwM3FyNUNLSjh6cjdRNVhhOWFjWmpDYzAzK0Q3N3U3VDFSRW9VOVRhQnBI?=
 =?utf-8?B?QjFyd3gxWkFBM3didERYZndXUE1OYWlJNkxnOGJkd0hOUklaejlObm1nanlS?=
 =?utf-8?B?RlFxNGR6cTRyRWFKd0RxcGt1dS9GOTZ1amVzYUhGaXZlay9TM3BxajVVNVRi?=
 =?utf-8?Q?UywgJ4e9ZBBT3Au5jtKmw2qERwRorIeFnv/qXyBY4I=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HyeNsKoJqOXmwbVGtcetsXiE6RzBBdAujR6qz8ulRHJeQWY9DO7U6ynZ8eVWxqJ0rHJpp2UwtqRYI3EcD5dSNtrYvrEbVw3lXFoDLA5EEzRGirPhmrGkafzQN7F9i5gRnRH4ZmERIc9FCGO32cyaoCJs8eF9rknzJOCs7Jo64cYZ6lvrl+PLP+hfIz6nHBWheYFQQg3sxOrZF5kUEm9xOQUMVQbhoVowZ2bu5IFUzNs+x3ZoELfCSGtFGVszFkl0TwPtPt4FvP6Qem5B+QDteq9Yejz+60+lBRz/WRbORSDnvyWculW685vgx7wdO0pJT5sJ8JQUwI8h7aQA6J2RO4MWre9qfTgv60RuXco2CKi3qc4axbEtqQDhe3jK3GzoXZZJjDbfokpNeTKP2qCzPIUvtoIEQ9IijZMFWiaNGAP5QCUNiM26DyreatDsE5gR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:16:10.9842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f47e3e-04f8-4a81-689d-08de63d66b7c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5528
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] ARM: stm32mp: Factorize code for
	STM32MP2x
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11653E45C1
X-Rspamd-Action: no action

Functions read_deviceid(), get_cpu_dev(), get_cpu_rev(), get_cpu_type()
and get_cpu_package() code are duplicated between stm32mp25x.c, 
stm32mp23x.c and stm32mp21x.c.

Migrate these functions into new stm32mp2x.c file.

Adds also a fix in read_deviceid() for STM32MP13 and STM32MP2x to avoid
a Synchronous abort.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Fix typo in patch 1 commit title.
- Link to v1: https://lore.kernel.org/r/20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com

---
Patrice Chotard (3):
      stm32mp2: Migrate duplicated code into stm32mp2x.c
      stm32mp2: Add check on syscon_get_first_range() return value
      stm32mp1: Add check on syscon_get_first_range() return value

 arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c |  7 ++++
 arch/arm/mach-stm32mp/stm32mp2/Makefile     |  1 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c | 44 --------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c | 44 --------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 46 ---------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c  | 63 +++++++++++++++++++++++++++++
 6 files changed, 71 insertions(+), 134 deletions(-)
---
base-commit: 66891ffb14920e35abfafcae795cf4604de6682f
change-id: 20260203-upstream_factorize_and_update_read_idc-c0c548c5b198
prerequisite-change-id: 20260203-upstream_add_stm32mp21_support-0b0ed074dda9:v1
prerequisite-patch-id: 74f65301011fc90379e04dd25eebdf3cb2a24fe2
prerequisite-patch-id: cd2da5c9e5f556ca492c91ff76ee91cf939d126e
prerequisite-patch-id: 2f2d9574cac61f21c1caedf11601b3b79806e5ea
prerequisite-patch-id: ee473859e76b2783f858e603f0956ed7644192b1
prerequisite-patch-id: 79f85d5f5eccc0a773f973c2234939916bb84ef1
prerequisite-patch-id: fe65a2b4f620e362d1a963b00c8c9cda5c4a85f3
prerequisite-patch-id: 37714354f2763227c1ee72d57626c36687d03fb4

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
