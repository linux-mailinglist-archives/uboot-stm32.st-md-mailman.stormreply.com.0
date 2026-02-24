Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMnbF/l9nWk/QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:31:21 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93218561E
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:31:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 773F9C8F286;
	Tue, 24 Feb 2026 10:31:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011029.outbound.protection.outlook.com
 [40.107.130.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7DAC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoy8prAFRWuEKtmBSjEuJeMh/+HCabo+srbsk4AgEf9nY122YOe4fDbDiskKJM2CF7gO9L2xPzDu41Vlr43sEOPtanG3i2jmaRsByd6Jo0RMEhM1D/59yE6yrLQ5VbtGcyhwNACA4mISRp5u/ei6V+nHLRRWCYGvAJnIurYVCc6lrVGqFEZwXNSEWzuDTJDZhBZwvdwef5Blw0sQ+qVX5VsCDRdRk5ZEN6MopiamtDCkLJaO0s1GJG1eyjyXVCC+egKONeyx55x8HkviVySfeDtuuzKnGAx4/uQWiid9Q9+UEAcIRI4RJ8O7b/fiyu+5zxdRg81DlR9/+67bSICGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOO4AJsWd6FT2QS0JMKco/Z47KlnhhEhqxsY+gLETKs=;
 b=gqr5KP9HYH+ubXS8SUfjmtlqmC7dTe1ppJhpt160zA8vczqiE74S7csvQqRINBlnsgvtheslGB/8L8gfZUbsb8Aa6yQ+jkE2kLHUK8DYihHwtITv5vbxTgF5ItcdunNhGdgxIgOQyE6O8JJylfbwiaCQZ8gqpYIY2gxWA4A5Wb/39r+LT78CeVwTPcHLjOWrgvCo3Vs0l9h1i/crnlY+VX7LK0agg6ol3oDoIHoJ14I6OObOuVwB0NGuzReXAOwkkuJ0PL2wZdrwRW9UYm2nRWAkA+jTL7vylU6A8vDvEuE+69WA/DeCJuzZmT1HNpiL5H14jctBXn81mRl0WfZqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOO4AJsWd6FT2QS0JMKco/Z47KlnhhEhqxsY+gLETKs=;
 b=U/2z274OoFIVpU7PFqfLryEzmtUht3CMf7/zd3aRNSp/0vpL+tG46CSLJav6WQtwziXrNUERafJ9RdzwIC7xUfMgxdWHBY9IB9pvL38eW2sOBQYBOaw0iybRQF6iqNc40KomE7Rb349SpRkm2nPC7EOEIhocK6THqZtASWr2/eqbyZEiyWkQxCrCMBG2jATrBSSAlkKMd2A0cyXv5UKgnNvmh5I60fKHMkj77ZXUwmFUdZ4vRXG8Tj+5WGS/zmsughY+04ndEtVLqmofDnFRvnvMCzBVzzekhVylnTCuDQHoOXN85mhXC8K6BgPqX8+6a/z0ipq0nK3zgtEcOATI2Q==
Received: from DU2PR04CA0200.eurprd04.prod.outlook.com (2603:10a6:10:28d::25)
 by GV1PR10MB8808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:31:13 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::6a) by DU2PR04CA0200.outlook.office365.com
 (2603:10a6:10:28d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:31:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:33:28 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:31:11 +0100
Message-ID: <334ef06e-3449-4c7e-8950-b9ca5c4cde96@foss.st.com>
Date: Tue, 24 Feb 2026 11:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
 <20260210-upstream_rifsc_update-v1-2-74c813fa4862@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260210-upstream_rifsc_update-v1-2-74c813fa4862@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|GV1PR10MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: a3478541-cf73-4706-b872-08de738fd584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3F6Rk1FUG5mV1doS3V4U2l4MHBLTW9hYlN6Z3FmNW95NmV4d2dlWDVOTGRn?=
 =?utf-8?B?cS9MV1BCbTFORGtqYTlnSFY3WEhlQUtwejJhbnpBSE5VdWJueDFGR2o4TUMw?=
 =?utf-8?B?RlVVdGIxeTRVb0VUVFVuZXFVQWdIUDF2STRnb0RlMGhHbnBocW5XZjNqZ2xD?=
 =?utf-8?B?V0dkbVB1VXBKVS82aGtqaGdUajRwRGtod09sQ1lFb1lXcUdDSjZ6RGVVQUw2?=
 =?utf-8?B?REFpcjJrYVl5dm9pcU1UOEUxaDBSbG5ZWDFkYmxqd1N3K2xESTBzR3JPMEV4?=
 =?utf-8?B?Slc4Qm9kdXI0cWxOMHpRMUxzV0w2bXlJc09laVZhYVVqWk8vYlVQSmhhdXZY?=
 =?utf-8?B?ay8raXRFbXc1ZExQcG5nUXdCRnlZdlVSSkZoOEc3MTF3aUpxRHloMGVrcEVH?=
 =?utf-8?B?NmpPUllKS2dJdTVYdlVJUSthUFNneHErUXprcmhIa1FnL1U0MGR1Z2ZMZkNx?=
 =?utf-8?B?R1BxVVkrUjBPNXAvRXRvNHcwUTVKSVdrc0lYeHZQUlhLbitpZTFlYWJnS1lu?=
 =?utf-8?B?MXBmUmVBMGJMeXhaNnZ4citaSmpRZ2NXaTlHN1VjWVdkR2FhRnUwbGcwQldo?=
 =?utf-8?B?VVpjckppYUFkM05Pb25LM2J2dGF3c1RZNnlRTml1Z0hMdUY4U2ZPbnNvdkdk?=
 =?utf-8?B?QWlXOXdPSEJrWXM5bGlnNHZENk1wMnR5cW5wRzFTSW1QV2p4RDZ2T1VzdHln?=
 =?utf-8?B?dDFrMlVuNytraUxXRWtzaEwzV1djOEdEZUs5ZmhtTHNxMnZ2dElKNU5oTHNm?=
 =?utf-8?B?TWhRbWtlZThIclE5R0U1VksyWnVFRGJJaVZUeThEOTduRGhVM3NhQ3FFYUhj?=
 =?utf-8?B?cW5MQTRxQ29LcEpPZkhoeGdOVVNoRUVyVzd4RjliUGtvbWdFMFdKbVpHd3ph?=
 =?utf-8?B?YXliM0h0cklsZTFkSlJ2MjljUTJ3VGl0V2RIZit5QXUzandQajBhY1pUZC8v?=
 =?utf-8?B?Y3hQem5hSmI4YmxaMHN5VURzMDJ2NEg2TnJ2Mm1MQnI0aDM2ZVpJdnJ6M3pW?=
 =?utf-8?B?R29ycDA4UElRSHY5eG9zcHFtczRqK0VOSGUzWGpEakRRUmFOSitRU0xwZzY3?=
 =?utf-8?B?NmdlUGE4RFpzclRRcXo2ekYvTzNIbnJuZkpZanpNMXArRFZsODlPV0x4VTI1?=
 =?utf-8?B?VDBMc2FUd3U5NTErbXJLSStzR3hpUXlmMldJWm1HTTN6WDExdDJIc29YaS8y?=
 =?utf-8?B?SnRqdjVMOVdkNWhTQW9DUkowQU5KeERuZVFhd3pDQjdLNTZScjh2UlYzQmhN?=
 =?utf-8?B?MWd4WEg4YmxMNWJ6SG5JcjRpTm5UUlRYWFZtN241RUtTMXpNTVBDWENKNmlx?=
 =?utf-8?B?N3dBWkJidlJJSTY2QjltZm05TnJuaDRYSGZKZ1dsOS9VeWUwcWVKQmxQSk55?=
 =?utf-8?B?V0s0VkZEY2FhcTZ3L0Y1UDBzb3RWbi9nZEIvYTI2M2lHWnloMzI3WVJJeFV1?=
 =?utf-8?B?Y3Yrd0ZXdk4xS1l3cWF3Zm93Qm9BZDlxaDBENFZTdnNKOExYUklNRDNYbE5G?=
 =?utf-8?B?eWllVDZrZFYyV3J0OWhyVkJ6Qk5TNGpmSTc1cWJhaVUrOE15TXVoTnkybTJG?=
 =?utf-8?B?eTFtT0pIZ3V5WG1iQWhpSUI1STlvUDJIZ0R4ek1rOVRnM2xGZVBQaCs4RDRV?=
 =?utf-8?B?L2tEKzdrWk9Qa2VRbC92YzVwNkRTL1BZVEdaRGFsMUtwcDJRbWFSMjQ0U0Iz?=
 =?utf-8?B?MWlUTTkzQ1J3MnQzcW5VMUJNbEdzM00wb2cxT0tGSFp0b2lMQ3RGdVNDQlpD?=
 =?utf-8?B?T3daeXh5YWJXOXN5Rjd2TUZ4VnFZdDBvSXZGTk9pMi9WRWJLT25XZGhTZFBX?=
 =?utf-8?B?WG90azl2REoyTDNEYmNUemc2N0sxMXZJa2VYVzBQWUNZdksra2U2Um5Wendl?=
 =?utf-8?B?MmplSlFPZ3dpMmZYQU5XV1pCSXl6WU8zKzFvV08wSFBkemtIcnRPOURiR0Fo?=
 =?utf-8?B?TFZUam1VOFMybU1yMUxFRzM2U0RNTHNSMmlkZFk1cXNqUDlBNzROT3ZyWjFl?=
 =?utf-8?B?Sm1HYXU3dHNQQWRKdSs4UkpDNVFIbnpJUFhSNW9sYzRYTjlYY1JkeFM2SjYw?=
 =?utf-8?B?bW1qQVpNWTN2dlBzWWNPcHBHZ1lqTVJXZ1BNOFVtY3ptMW9CQTNNaWhsWSty?=
 =?utf-8?B?N05Pak1WSUFPQWxyN0N2dDBQbGhKeXlDTm5Wc09HY1lsYWVCSitoRmZ3ZXcy?=
 =?utf-8?B?MWxoWFc0c3lydUIvbEVzM2FJaFJBVHViY1BVYjdUazBpczhhQVRMUE1DK05M?=
 =?utf-8?B?T2gvY01WZDExRWhyaFhtaWlBUXVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nlK29tuHdGcwfCfw3XzvF40cJf6n/KTJ7KKbesYGLX0Rrne38nRd6bQR9pQwBKVUiBUxH3FCbsSBwaXbXur3kKafx6/AxnPMgkAUnwBgqTEhwYNTzmLEH5A+LkuvkDjGDVi+yTMCm2q/7SzkSXmguKCmGfd6B9/EdDmKuKH/i3i0YoXFUN4lj7IVmIeSlEarcaGqdBiv0qejKnm7zv8KKxKEGz2PkmJ/R9nUe0rur3X7n7A5fX7YdSvG5cFpnZKZ0e1yGv6A/jayYyh9PaXNXHNJOEXsadU1rR4u0HNnHRTzsFaGN2mjI0kVcBUcAH7bdNNsMnRa0pVV9gj4wSi/LHfl4IrwEj4QaPQduMGOc8o2KxZj+dwFs9YJ6MGiFrhaMZ0PDLWikjTYXKDwjjL6m9CCSoLivvTAxgdALV+Ne16X7cBAwpMOJjEQf1d2hntT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:31:13.1884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3478541-cf73-4706-b872-08de738fd584
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8808
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: stm32mp: Do not acquire RIFSC
 semaphore if CID filtering is disabled
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
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.807];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB93218561E
X-Rspamd-Action: no action

Hi,

On 2/10/26 11:26, Patrice Chotard wrote:
> From: Gatien Chevallier <gatien.chevallier@foss.st.com>
>
> If the CID filtering is enabled, the semaphore mode is disabled as well.
> To avoid an incorrect behavior and error trace, add a check of CID
> filtering state before acquiring the semaphore.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp2/rifsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
