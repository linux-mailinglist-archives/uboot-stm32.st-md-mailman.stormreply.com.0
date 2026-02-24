Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG7MHkqmnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:22 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67370187959
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6FCC8F289;
	Tue, 24 Feb 2026 13:23:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013002.outbound.protection.outlook.com
 [40.107.162.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6819C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRR8FPry1J8SmX+Ad5Bf2UrikEeuj8EK2m28QZh4mxWuGkl8Va/FpoCJv9vgR5K7CPyv2dw8uFNts8YFMLfqLImvXZAzGIqV1diCudIVbslvnP4MtN4eZTK+CwI51+mSAzXjQ4py8g2LsRSYqNJ/dqUGTiIlopX2T9wQVaSGNe80XpsWA860jfq21ebE1kj7EIIbIo4/vxV/0AWWN6N27UAx/dbPGrJ+isArRb81sdsCq08YSu1z/YlR0s+Xr5DeetATICiMjJ6CIRg9aVxMs/eiE6HSar3mi9l7cfKt9ZPIiQeHYRO7RNRt5amclDg9CJ/CX0NEW08RBnN9OqBpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUkC9nP59IbjyavUTe/FqKV1oCk3x3AeIJKqBFlGBHk=;
 b=cRLiPnv1JApVGaU8dts23BYu+jvcyMz44HMXniiSiTywqDhFoaDheYHMU/zOCYThSSJ+bDEOgpq2ZqQcHczu68kvyjV8uJZveV2hyuoi4Zs8LkDBSuZClMuMv99gpD2tGs3+EHgzGSTDz5CYs8QNymAWvaEB1e/5JA4BabGfan3xZoCCnIguC2k/wIa3ALtgSftAO5tKCNI7nfI3dijSrmTPA4+xuBQubewLyJLlfa7CcQB2Ki+aawBgrcYCFQMjK0DBeJoIIezBahNmxlPe0SNm9FT5HKjE/fCRa0CLedY3Sg02JUdmyUcQos1YCWMfo4FvtUsNzUQxu9PcRaG/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUkC9nP59IbjyavUTe/FqKV1oCk3x3AeIJKqBFlGBHk=;
 b=Y2h6+mt/jLPjEmRZQ0ukYrbBGVm8A0ciSscNqRMDmM4+kctWC4CKhZ3ALsyJnbSojpuaPj4oXndkWN/tj+NcYtZtnfSOJ6LlWhgaZe1W8Ms6/yX54VMrComPiWhk2N4zMAF3uxcpK2pt2pSTQvafnyfJ6NcTsPj8sVNV/+YmEx4nvvoU5e9Ve4hVXndEY94pZALlZbjyxwTnoZpQXdCRT94SCIzDvuQ2aJF1hdp8ZieUXIWEeSdHPwV6+3he/hXhxkt1ryGrf71paiuki22aM76XMaFnyC6TyGzm5teu/3ef1jrowLNSjqYcbqyd00jOYexiBIy/IRqWO+ERas5Aqg==
Received: from AS4P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::18)
 by DB9PR10MB5164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:326::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:23:16 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::a7) by AS4P191CA0003.outlook.office365.com
 (2603:10a6:20b:5d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 13:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:23:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:25:23 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:23:15 +0100
Message-ID: <6c355ae6-f952-40c4-9ee2-f2d6f7613a9b@foss.st.com>
Date: Tue, 24 Feb 2026 14:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_stm32mp2_cpu_fix-v1-1-f37c509d79da@foss.st.com>
 <d97423f5-ed08-4c70-8061-686a8effc97e@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <d97423f5-ed08-4c70-8061-686a8effc97e@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|DB9PR10MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2deb50-1396-496a-d05e-08de73a7deaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODdPVDJsb3dXOEtRaWJyeEJXM09VbnFzMTVxYXRxTFhQekZPRWRjclhqNUd1?=
 =?utf-8?B?cEg0cUFUdURQWFRNUW9KVldoSzBRS0tGdEhzUEpDd2lvZldTWUxZSWRZK01q?=
 =?utf-8?B?QWZvOXo2VUowQmVSUUM4ZHRRSGM3MXVFaXZLaGMyWjFpNlFMMjhFUjBtNEh0?=
 =?utf-8?B?aFZKcWIwL0hjeUppOWkxUW52cjI1L3ZPTUZvVDlDODg1ejZUNjd1cnFWd3VN?=
 =?utf-8?B?Qi94NFhrQ2VvNy93UktUM0tvdU9SZit2UnJoMjJPcVZuQVp6NlQ0T3YzMnlC?=
 =?utf-8?B?T1hqWFJLc3kxdHl5bTVic3pnaG5qeGFoc3NET3h3SW9NODZGbVMxc2pXVkFV?=
 =?utf-8?B?OU83dFB2VzlVdkFua0ZnbjkweSs4K1kza2tRMkIyemdYT2lqUHBhL1QxOG54?=
 =?utf-8?B?NXkra1dvN01WelhvVjVSMFYrYm1LKzZ1R1Evcld4TTNJT3lYNlY0MHJUNDlH?=
 =?utf-8?B?VFFmZFVJckpjcmRZQ29INDhnTHRWU3JBRW0wQkZueXJ4b0QveldHOWxqRjlZ?=
 =?utf-8?B?c1FHcmZYbHZnWlRUY3pCRnFLUUFybVY0ZDR3QitHTzhac2tsaDU3WnZnZnhR?=
 =?utf-8?B?S3E2ZCtKZVZRR2poOEc4L3A2YUIxdEJFMTM4b2Y5cjU2OExRWGFrNGRtalh6?=
 =?utf-8?B?Q3ovdldHQXRQYW5SVitpSnB0MlAvSlFxeWpQM2RJUUpyMHJQb0d2RjJneG1m?=
 =?utf-8?B?TmFvNFIvZDVmTzkzL2sraHh6WmZKSnlhblVLUjltQWVaKzB5OWdSOVJwT1l1?=
 =?utf-8?B?SjBlbUVNd2Njang1SVFMWmV2VmdaK1FYc2o2Z0UrWVdqanI1Z0tlMEoyTGhu?=
 =?utf-8?B?LzV1blQwUTJleWFzVWdHR2FZakltMjkzZmRyTnAzQ2NyR1B6b1UwM1BsUlgw?=
 =?utf-8?B?SnpxZlBWOFo0L2xDWW1EaXFXUUh6dVFlZDFXV1A3dFFmb0tkM3RYemEwQlFr?=
 =?utf-8?B?dlFGWXpvTVlaTm40bFdQSDNNT3BjMzZnQzhQWDJNM0pnWm8zWndxckZOWjc5?=
 =?utf-8?B?NDNBZXNaV3BTWldmVzYrblEvdURmYWV2eDFnU1NqMG1nY3lYRkNnWG9pYW1T?=
 =?utf-8?B?akFxc1dsUWV5bHpaaVZ6VFU4RU15ZkQ3NUg2cmNibzlRaVJjQURqNXBkQS9h?=
 =?utf-8?B?MzNlS29MME5ROU9oVVRzZ3hDVHBJRWpGaXowYS9aME5TNmdhU1QrWnVUaGhi?=
 =?utf-8?B?dDN1dURPZDNpZWxxRzVLSjB0eDNHeE9RNlBMRFdYRHdCeUN5UldsQ05DQThk?=
 =?utf-8?B?TUdrYVovc1F4MXd2VTM1b0ljbnlXNmVoV2dBcGV0dTlWMmszUTZxYU45WThm?=
 =?utf-8?B?aWNmVzdPUk50U0VObnFjeHplajhQTHk2OWt6WStieXIwOTlKdUxIL0EwVldq?=
 =?utf-8?B?UUdsVU1TNFVUZTU4OEFlM0JsSk5NMXl6VjV2VkpQUysvY0t5REJBUEFtTWNK?=
 =?utf-8?B?UlgxS2pYbDhGOXFmTHlUNWdIVStEVllwdzBlMkUrcDQxMmk0U29zUzhkZ0l5?=
 =?utf-8?B?L3h2ZnVvQU05dW5OVVVCdURwV1NXK2VTVmYrcVZoWXlYNVNiaXlha0ltUGF4?=
 =?utf-8?B?d0tTSnJjTmpOSkRZWGZoeGI1TFoxeUYyMlJtdmJocEMwa3NDenA5VmhLZXNM?=
 =?utf-8?B?QUd3NFg3VDJ3bTZxSGFRUWdwdjlUSFJuSUxKYkdSRE9wWENPVVMzbHFreGpp?=
 =?utf-8?B?SHhQUG15UDZOZUxPQVUzeml4SVVUMzJKTnhFVkVDYjlqVXR0eC9NclczdHVa?=
 =?utf-8?B?am0xdXEvenV0SG5YUFRKV0Z2dGxGSzlaa2xyUFYwSktWNTdXbW5FYmd4M29U?=
 =?utf-8?B?T1dJTEhYMjBMVHhham4ydFZFREIzWGhGQU93TnBQKzBMc0FEdGt6WFRDckEv?=
 =?utf-8?B?UE9qc1hHeVJabzZ1M25BRU91THRLRXFIV1JNa3REeTBhRWM3bFl0VG42eWs2?=
 =?utf-8?B?SzNvcXg1clJCMTkwQ3hQcWdwdmZBWWRLVElZOGY5OEdtS21PU0R6OEVSOWpQ?=
 =?utf-8?B?WC81RHl5VUdxNXh5Z3pKaDJpWVFkRitWdi9lakNNVjhZcmJ6RzVVYVFZM0JZ?=
 =?utf-8?B?eDBYU2xsYmN1bzBaVEl4RlBkYXlUT3lLd2xPWlUzVml3Z1d0VUlZdlg2K3dO?=
 =?utf-8?B?LzQraFR1Vm5SMXZsZ1ZUVHlYRGo3d09yczgwTE01TjY3OHdUMnoxTEtpTHpv?=
 =?utf-8?B?WDVsRGlEODB3R2hWNHZrM0NURGVVSWV5bjJhWUd0VkZSZUxQa2dBaW9vMkRM?=
 =?utf-8?B?WjQyK3Z4ekRVeXU5YTZEMjNwZm5BPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wp9C/fcxnpXpHfVdcy+MOPfCa1+GhtcRbTFOd+Ee1dtzGksuyxzbkQvCs40pzynFVapPzuogAeU+GSekt48mCwA6rYzvJUvyfqX2wOi91bECMBbPksZDufopQmiL8sOsCEz0DQa5ygfvil3Eg0tD8PVaf8uAyHUSBF71EzPJaLOlQ8vY7Mr1lfsfGlX2RXC/9wzNI7BIYaFmEnbQfTbiSYZOS4ivm4TppgzMIL/FsM0/ZzduI4pEIsXPrakUYod5KrSW8cqnN1OwWwTYuNnb97YBogMXWZd8/HMPWVOgMH2FpqI75lt0Il/8bpCgzj2xprRhC3aARjLGaqDwx1kW7LnPD0vc+ZjfHEzlKjeC5axF3raIw7BJbAal7LJ4U3pbFPX3DOnYIbYhkDSkShtqTD+xQ0dbRasyrlx2yWeppwVE9EfECHnCcDAPWpp4gqBx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:23:16.5140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2deb50-1396-496a-d05e-08de73a7deaf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5164
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.298];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67370187959
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjM0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMTAvMjYgMTU6NTcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRml4IGluZGV4IGNoZWNr
IGFnYWluc3QgYXJyYXkgc2l6ZS4gSWYgdGhhdCBpbmRleCBpcyBlcXVhbAo+PiB0byB0aGUgYXJy
YXkgc2l6ZSwgd2UnbGwgYWNjZXNzIG9uZS1wYXN0LXRoZS1lbmQgb2YgdGhlIGFycmF5Lgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9jcHUuYyB8
IDQgKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2Nw
dS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jCj4+IGluZGV4IGUwODFk
YzYwNWI4Li5hOGE2YmNmOGFiNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3N0bTMybXAyL2NwdS5jCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9j
cHUuYwo+PiBAQCAtMTQ4LDcgKzE0OCw3IEBAIHN0YXRpYyB2b2lkIHNldHVwX2Jvb3RfbW9kZSh2
b2lkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCBib290X2N0eCwgYm9vdF9t
b2RlLCBpbnN0YW5jZSwgZm9yY2VkX21vZGUpOwo+PiDCoMKgwqDCoMKgIHN3aXRjaCAoYm9vdF9t
b2RlICYgVEFNUF9CT09UX0RFVklDRV9NQVNLKSB7Cj4+IMKgwqDCoMKgwqAgY2FzZSBCT09UX1NF
UklBTF9VQVJUOgo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGluc3RhbmNlID4gQVJSQVlfU0laRShz
ZXJpYWxfYWRkcikpCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoaW5zdGFuY2UgPj0gQVJSQVlfU0la
RShzZXJpYWxfYWRkcikpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogc2VyaWFsIDogc2VhcmNoIGFzc29jaWF0ZWQgbm9kZSBpbiBk
ZXZpY2V0cmVlICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcHJpbnRmKGNtZCwgInNlcmlhbEAl
eCIsIHNlcmlhbF9hZGRyW2luc3RhbmNlXSk7Cj4+IEBAIC0xNzgsNyArMTc4LDcgQEAgc3RhdGlj
IHZvaWQgc2V0dXBfYm9vdF9tb2RlKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gwqDCoMKgwqDCoCBjYXNlIEJPT1RfRkxBU0hfU0Q6Cj4+IMKgwqDCoMKgwqAgY2FzZSBCT09U
X0ZMQVNIX0VNTUM6Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaW5zdGFuY2UgPiBBUlJBWV9TSVpF
KHNkbW1jX2FkZHIpKQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGluc3RhbmNlID49IEFSUkFZX1NJ
WkUoc2RtbWNfYWRkcikpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogc2VhcmNoIGFzc29jaWF0ZWQgc2RtbWMgbm9kZSBpbiBkZXZp
Y2V0cmVlICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcHJpbnRmKGNtZCwgIm1tY0AleCIsIHNk
bW1jX2FkZHJbaW5zdGFuY2VdKTsKPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiBiOTlkYTA1ZTE1
MzhiOGZhMTUzMzIyZGE4MjkxN2FmMmFhMjdlMWQ2Cj4+IGNoYW5nZS1pZDogMjAyNjAyMTAtdXBz
dHJlYW1fc3RtMzJtcDJfY3B1X2ZpeC1iYmJkMjRiYTRmOTkKPj4KPj4gQmVzdCByZWdhcmRzLAo+
IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3Rt
MzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
