Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PDAAnA5e2l7CgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A193AAEF5F
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8B6BC5A4DF;
	Thu, 29 Jan 2026 10:33:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C152EC5A4DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 10:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5xOe0Pv7wirzkaCOnGzE8yyxgUCsCuENgPNGn3NCO/0yqhPg/6qw+EPC68QOaMGwzAiM1/UDZESHQKiD8pSOAMae5iapmwdCgJa5mPqQHpbaiu6zMIX+WvOI7duS16FMioAv94iXNkyz+9PT2XinDH8mjwL4RwXvUg5TpHIaFaZB70mLObbwqRM56WQ9KvfZD1c2LAvSgsbKfXcgxIWWRlZkCV4jiULCnqP0XmNF80bRc/9EaWPyQIzNTaVZXAFjS8cRFYUN3cbYOX9Ejk2QjD5lr+F93+YUshH5QcyKOG1BagVF/7rWiOJTJGRKguow7M3i+cIy2ixDqCkT22Ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WKEMb9RFsoDO9SEfXjbrTuFiodCn2+kT8JoeqegIAo=;
 b=KsVUmjj/kwxHegT275Jkn6+37nMaw9eAdd0+4iegNgbOaqVl/PbNN8emr9r83Zy5U2Wtw4hqkpIC3KuGL/DV2N+4tpMEVd8i/ZvGPfdVWcFf5biBMfjaLyELlt4XTi2OeEA1xe0a4fWlandSBK/HVYmUw1t5LLtgCccr94UhsLiEdGIwnME6NQbJOt/6jbdI+aOTGJSufBsdglFU5EiDt9uqUVKkRKERDBOwBUwB99XJwkHTmXa3gMmtKSf/MRsJJdlCLoyf//2hQKnC/niULnl08MJ3sopqw6eDD8ip/Ge+pXuCQbBRfR0KycEPHp0QCH6TD50lR4rzKqGJ010s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WKEMb9RFsoDO9SEfXjbrTuFiodCn2+kT8JoeqegIAo=;
 b=P7tBP9NhtFR/Iyb5nO+jO7Be9QwZ/9upgrJD018n1TpmoQPLa7Q9mSC1KPk/44d6KiAQf5P+y/eSdA+48fKzBwqiP3w7X5jfxAsixOUaNy8jtbS2KbpZoEdJrtaMdnm4PJT1OtplXr4DtAhA8bjT4GwV7CdpIrulsev1LWqb3vzqF+gBBE6NXexqXWkPQD51ZhQP2irScXuxPQnZd6bVpZhs7HjUdk3bRuVyGgho9pCIcZXamGWWmJ8OxbHoy8BFKsvpTl5GSiLRw+cuW75xXfJLiPBhY8N7WcK9GZ9KDpTtWYL76ZkBt5KVdPrLU4I1ZKVxGAPH9twYk4j/SPbaFg==
Received: from DU7P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::13)
 by VI0PR10MB9500.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 10:33:11 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::c5) by DU7P191CA0009.outlook.office365.com
 (2603:10a6:10:54e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 29 Jan 2026 10:33:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:33:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:34:53 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:33:09 +0100
Message-ID: <b8c4dee2-2086-41bd-b3f5-0f6ed91abdd0@foss.st.com>
Date: Thu, 29 Jan 2026 11:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260118104912.1672642-1-dario.binacchi@amarulasolutions.com>
 <a7a69ca4-c8aa-46cc-8745-249360a4e1ed@foss.st.com>
Content-Language: en-US
In-Reply-To: <a7a69ca4-c8aa-46cc-8745-249360a4e1ed@foss.st.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|VI0PR10MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 743bd27a-950d-494c-d7fc-08de5f21ccc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdhU2NUM0ZBVTBMZFFYdExOcnFLbVFEZXp5VmdQZUJ5dk1PTTdLMGNCTUhX?=
 =?utf-8?B?ZllIRnAwaWZGcEd6QXp6L3JCL0NCR1F0UG1hRzlsL1hicGNLUkEzeDBVRXBx?=
 =?utf-8?B?ZnlKK0NPY1M0YTNLaTVkNHpUVTUxbmVzS1FHem1sMTQ0RjJZZ2wrSDlDRWRI?=
 =?utf-8?B?SmJqSmdHYjVYNGF2dHRDaFFBcEVhSTdaZWlHU1NOV3A1QjVVZ1VGZjRSRjBM?=
 =?utf-8?B?L21GTXhtVTdRc2dqWTAzcjY3WnRzTjl5dDA2RVJwdlUybXVKV2dtVWxJalhP?=
 =?utf-8?B?RDJzNVRoRGVxdnpOOWJ0K0dyVi91SGpTakRtS1RVaTJvd0FPMHdMZkhLUGNQ?=
 =?utf-8?B?RFhXdC9iVk9QcFhFVGx4dWNBM2ZWNEVwNVBNRmlQbERSZ2VJZVkybkl3aEFH?=
 =?utf-8?B?MWkzMEZ1OEFsU0lWbVUzMDhJZkV2L1V3TG9XZHoyV3JYTm5tVlY4TjhaZUYz?=
 =?utf-8?B?WUlHZ29pZy9Lcng4RFhWMlB2MFNuc1dMMndvWUlsUDZmUlpURXFxalp3Vmxs?=
 =?utf-8?B?Y0pRWmdpb3JSRmRVR0tLcHk4bVpoYjlPOTlQN1ZMbVltZ0FSeEFIOFh2T1Q2?=
 =?utf-8?B?WDJrbVVTSFdCd1IvNCt4QzJkTFp4aUt3MGxJZ2hqZm1LU040UEpWSEdMOG8v?=
 =?utf-8?B?R1dVbmpLYjZIWlhoVXdGRW9KU3NKSkoyZ2FtN240NUxzNlVlTThMTzBOdlRE?=
 =?utf-8?B?ditiVlNNd3FVVkNLSmpoOFJ2T2x4NmVKVUlvQlJQdVJXWEh0VmVXbEtQdDJp?=
 =?utf-8?B?dGkybGFHSWx6R1RBWW1vTmlleUxuellXL2NHL3RjR1JJczJ0QmVCL3ovWUZS?=
 =?utf-8?B?M1p4ZXJzTTQ4aUtCb3NueEVkMldYK1NiejNKQTJLcEdzbVN5UGV4ZkcrR1ll?=
 =?utf-8?B?VHMreGJIZTQvbVd1V1d0MjRuUmNscFl6L3h4UXd5ZGtpYWt3Y2tjbFBRd0FZ?=
 =?utf-8?B?N29HZ3FQSXV3K0doaXhlLzhmWWwvOE4xamdoT0M1TWs0VWlvVGkvR3hnRWVM?=
 =?utf-8?B?a0dXaGt3Ymw4bUdQMENhbkt3M0NRWnZ3dXVSWVZmQzBLOHdualFsbUFjZTVm?=
 =?utf-8?B?WG5JVStwY0tFdkVFbk1HcngvenlFU213Nm4zVDB5TDdjcWwwUW5OSm1XVmcw?=
 =?utf-8?B?YWN1ZEFYWUR3bXJkWWJYeFB1UVpQalYvMjJXa0lDYWJUNG9aQXF3MjVETTdF?=
 =?utf-8?B?NGFnYVY5Zm50UnJPS3l2UndVL1JRRGRCM255NlZiQzRMMjl3SWtTQmNpMWZz?=
 =?utf-8?B?L3djQUZEQjRRMVRldTZwK3huTmpURlU1QU5MK280Z1JyMnlkRXQ3MWJtaFlW?=
 =?utf-8?B?dXpsMEg2T0JUR1BxQ25aNG5UbHc2RU1QOFJEZVR3bTVValNvUEVYb25Ud0po?=
 =?utf-8?B?WCt2a2FLOUI2UGJpM2hWZGMxcGFhaWZIVWpINWJoMXJwZlZpUURVclRIdjNR?=
 =?utf-8?B?eW5zMmZGZ1hoQWNPcWJuUStWQnhVSnJHMFBBZktGN1pVUGxBRThyeTdncUEx?=
 =?utf-8?B?KzRxc0hYT1c1aDBnZmlBbEZsMXdBWXlSMUlyUXFVUVNCS0lYMVpzWGhzSnJk?=
 =?utf-8?B?VEREeWJVL1hwYktzbS9pakpONXZLK1hQd0JndzRwUjl0WEphNFFydTBHVzJ3?=
 =?utf-8?B?NmFDNm42UkdLcFhXaWtyUG1RNTl0eXh0M3IyYWFHVm9hbUdLamQxV2trUFY5?=
 =?utf-8?B?dVNTQmxBekdnRWViTmpMOHhXNHRPOUh3UlIxQVhNanJyN1dOdjJLd3hHUElJ?=
 =?utf-8?B?dDJQUFVHaFZjTEV1QUxPQ3ZlTlZ6OHdsZTR3OE5qSEk1L2psZTBGK0VRUFZj?=
 =?utf-8?B?RzhnRWpmclZPQU1la0lkSFJPaVlDMnF6QUQzOHZlYVFNc0NsRnhTa2I2d0or?=
 =?utf-8?B?NEx5dDFWem4vQVU3b1F0UlFMVml4N2VKcVBMcWlCVHpkbEUyajZYbmlLR0tp?=
 =?utf-8?B?OGRXeTJBQ2RTWFRDdGR2cVRsMmRMY2s1MW8veXhuTFJpYzM1bHJQOWNxQjRa?=
 =?utf-8?B?MG9oSWxKRzU2ZXU4RDFqY3BzeXJmR0ZJY1NSaUhaK1BnTUhjcWZ2QStQUUhD?=
 =?utf-8?B?akxUbDIyRWhrS2VvRHRSaXFvSThPZll6cFVva3NKUmRSeFE5N0NHOElJZmdq?=
 =?utf-8?B?ZmZielpaUVBmR1FwQWhCWlpldWN2Tmp5enNsUG9oRDROZTFlbGVUdEQ3Nk5a?=
 =?utf-8?B?MDgrd0ZSQ2hpN0tyUlJYaE1hR25lZTRyWkYvMVlGWnBzaS9uUSt5VzdnYlNN?=
 =?utf-8?B?Z0txWlA4cTkzTDRtQ2E2MnZxZFhnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vYG8YKK8/3WQgfq/p9ri5WGRwDVnwlaeLJ5+9q+2J81q8bUqjCEJ0hH1gT31nltJMAU7uVevNqzJFPs3OmAGYolTg9EJ24E9dcAxiIzqBLvMjXf9fcF3Uf+SMBsK1ixtG4SUJJnOJv8mlF/+5+18VoBx1ELTeLczx3zyy1zHwsjjb2QkeHoJRekKLbuQwzJhr32KI+xp1PB6M3h7bnQGgktRdnM3Ms9tHDLelXxdZNWUjb5F18N0Kq8eCwYiXMrARzzL6x6zWZAC+0AggKIFbwyd2DTKVSvT78mVcn9ePLMFzNl4M6wMfR0CeLQWGBxNc1nTcxBrNwnGYn1WpQV2VVXHHjJo+RFzy7QAg21jrS5ggYL7vWZqUIbbx/oD35DXQRDgNw7MZ3vmaEhLtXfoCuFHAOv4kq5pPDTXnDWnyAQU4QIPhjjfe2o8INq7i933Da4Drw0qtutDX+2X/aOP+LyKnGQPXFxW6hVIQ0V7RPvb+GwGJio4P6UmB89ONPPCCmQmAIn8R7GcXeT6N8AUKkxx0a62KgL4VVg1GdEl+sOxp/q5mbnQJdkTyOxeZv01/Dvpiuviq2Hk3f5QSpseaXLXfgResFVogjj95UMDI+gPJlFzCmvm+YFrHbwttv9tjyHuF8sKOMA3AdSTfiOV/RMGvvrkeC7BMlWtHIOQzRGfrZm6X65zXcnR0ZmQHNZF5I2JbPMQdMlSVB1SVzlVhg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:33:10.5793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743bd27a-950d-494c-d7fc-08de5f21ccc0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9500
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [RESEND PATCH] board: stm32mp2: read boot index
 from backup register
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,amarulasolutions.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A193AAEF5F
X-Rspamd-Action: no action

CgpPbiAxLzE5LzI2IDA5OjM4LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gCj4gT24gMS8x
OC8yNiAxMTo0OCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+IEZvbGxvd2luZyB0aGUgY29tbWl0
IDk1YjVhN2RlMzBmNiAo4oCcRldVOiBTVE0zMk1QMTogQWRkIHN1cHBvcnQgdG8gcmVhZAo+PiBi
b290IGluZGV4IGZyb20gYmFja3VwIHJlZ2lzdGVy4oCdKSwgdGhpcyBwYXRjaCBlbmFibGVzIHJl
YWRpbmcgdGhlIGJvb3QKPj4gaW5kZXggZnJvbSBiYWNrdXAgcmVnaXN0ZXJzIG9uIFNUTTMyTVAy
IHBsYXRmb3Jtcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pgo+PiAtLS0KPj4KPj4gIGFyY2gvYXJtL21h
Y2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCB8ICA0ICsrKysKPj4gIGJvYXJkL3N0L3N0
bTMybXAyL3N0bTMybXAyLmMgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysr
Kwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmggYi9hcmNoL2FybS9t
YWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmgKPj4gaW5kZXggMmJmNTBjNzU1Y2JkLi45
MGYwNmEwNTJkM2YgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRl
L21hY2gvc3RtMzIuaAo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNo
L3N0bTMyLmgKPj4gQEAgLTE4OCw4ICsxODgsMTIgQEAgZW51bSBmb3JjZWRfYm9vdF9tb2RlIHsK
Pj4gIC8qIFRBTVAgcmVnaXN0ZXJzIHggPSAwIHRvIDEyNyA6IGhhcmRjb2RlZCBkZXNjcmlwdGlv
biwgd2FpdGluZyBOVk1FTSBub2RlIGluIERUICovCj4+ICAjZGVmaW5lIFRBTVBfQkFDS1VQX1JF
R0lTVEVSKHgpCQkoU1RNMzJfVEFNUF9CQVNFICsgMHgxMDAgKyA0ICogKHgpKQo+PiAgCj4+ICsj
ZGVmaW5lIFRBTVBfRldVX0JPT1RfSU5GT19SRUcJCVRBTVBfQkFDS1VQX1JFR0lTVEVSKDQ4KQo+
PiAgLyogVEFNUCByZWdpc3RlcnMgem9uZSAzIFJJRiAxIChSVykgYXQgOTYqLwo+PiAgI2RlZmlu
ZSBUQU1QX0JPT1RfQ09OVEVYVAkJVEFNUF9CQUNLVVBfUkVHSVNURVIoOTYpCj4+ICsKPj4gKyNk
ZWZpbmUgVEFNUF9GV1VfQk9PVF9JRFhfTUFTSwkJR0VOTUFTSygzLCAwKQo+PiArI2RlZmluZSBU
QU1QX0ZXVV9CT09UX0lEWF9PRkZTRVQJMAo+PiAgI2VuZGlmIC8qIGRlZmluZWQoQ09ORklHX1NU
TTMyTVAyM1gpIHx8IGRlZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCj4+ICAKPj4gIC8qIG9m
ZnNldCB1c2VkIGZvciBCU0VDIGRyaXZlcjogbWlzY19yZWFkIGFuZCBtaXNjX3dyaXRlICovCj4+
IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9zdG0zMm1wMi9zdG0zMm1wMi5jIGIvYm9hcmQvc3Qvc3Rt
MzJtcDIvc3RtMzJtcDIuYwo+PiBpbmRleCA3YmM3ZDJhNjA4ZmQuLjQzYmM1ODMzNzhlNiAxMDA2
NDQKPj4gLS0tIGEvYm9hcmQvc3Qvc3RtMzJtcDIvc3RtMzJtcDIuYwo+PiArKysgYi9ib2FyZC9z
dC9zdG0zMm1wMi9zdG0zMm1wMi5jCj4+IEBAIC0xODgsMyArMTg4LDI0IEBAIHZvaWQgYm9hcmRf
cXVpZXNjZV9kZXZpY2VzKHZvaWQpCj4+ICB7Cj4+ICAJbGVkX2Jvb3Rfb2ZmKCk7Cj4+ICB9Cj4+
ICsKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19GV1VfTVVMVElfQkFOS19VUERBVEUpCj4+ICsKPj4g
KyNpbmNsdWRlIDxmd3UuaD4KPj4gKwo+PiArLyoqCj4+ICsgKiBmd3VfcGxhdF9nZXRfYm9vdGlk
eCgpIC0gR2V0IHRoZSB2YWx1ZSBvZiB0aGUgYm9vdCBpbmRleAo+PiArICogQGJvb3RfaWR4OiBC
b290IGluZGV4IHZhbHVlCj4+ICsgKgo+PiArICogR2V0IHRoZSB2YWx1ZSBvZiB0aGUgYmFuayhw
YXJ0aXRpb24pIGZyb20gd2hpY2ggdGhlIHBsYXRmb3JtCj4+ICsgKiBoYXMgYm9vdGVkLiBUaGlz
IHZhbHVlIGlzIHBhc3NlZCB0byBVLUJvb3QgZnJvbSB0aGUgZWFybGllcgo+PiArICogc3RhZ2Ug
Ym9vdGxvYWRlciB3aGljaCBsb2FkcyBhbmQgYm9vdHMgYWxsIHRoZSByZWxldmFudAo+PiArICog
ZmlybXdhcmUgaW1hZ2VzCj4+ICsgKgo+PiArICovCj4+ICt2b2lkIGZ3dV9wbGF0X2dldF9ib290
aWR4KHVpbnQgKmJvb3RfaWR4KQo+PiArewo+PiArCSpib290X2lkeCA9IChyZWFkbChUQU1QX0ZX
VV9CT09UX0lORk9fUkVHKSA+Pgo+PiArCQkgICAgVEFNUF9GV1VfQk9PVF9JRFhfT0ZGU0VUKSAm
IFRBTVBfRldVX0JPT1RfSURYX01BU0s7Cj4+ICt9Cj4+ICsjZW5kaWYgLyogQ09ORklHX0ZXVV9N
VUxUSV9CQU5LX1VQREFURSAqLwo+IAo+IEhpIERhcmlvCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBh
dHJpY2UKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
