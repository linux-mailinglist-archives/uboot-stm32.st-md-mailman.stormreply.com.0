Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBlUOm85e2l7CgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88378AEF5C
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38EB8C87ED5;
	Thu, 29 Jan 2026 10:35:16 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011047.outbound.protection.outlook.com
 [40.107.130.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B21B0C57A51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 10:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRo/WMa2Bdmda0WwXD+BbBWBt8JdjFc2cvagYw9CXU9s6DowW1A7PAXMRhG8ykEF+AdsyGCn79K7YWSF5LSvCuKkEucF3/kpcFnZXdqn8v7DLWyf4vzPXvZEUM2mFgtvZmbkNuhSWPfK0NMwSPJjDYuE/UhwC9uypQmGj8h9dWGHlP9Hwx6k6lSS7kDoruROCWNoXjWNbX+HoXbbOT3lB6Lwg9RZIIsIKqmsJOlT+roxSU3m7lhMwJdw5kYXJWeMOcRHk57eF9byQMGaKhzY3Y4nAftYDLdoI90340f+SuIwozupsRTn/nUdOnQHAbc9dFPZ3t1v+2/if7q5JKTALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZCnuhzoGS1LwWehGZn8lz1fDjC6DAWP0qjhiP7KRh8=;
 b=suVRogMZ+27nI4qGiknKZIHupQzwO2O38ZJY3+dDbdHpfn8/5Z3y3TBvPbqZqbfPIWFWSZlzQaFxYN8w7b/QWR+ST6aXpe1l9BonLMxFLHQH5e7kvkrfzjQVA2b2rhwgXS2RP9DPklcSPIPXUA5/fmtBo5virvd8OwjU/407r3dHpb/EI9Nwm4cBh1yQfpAaQBjtFRzUbAgPdtir5C4Qb2XLMyU50zryMSztdnfECSFtH+t0UUPqKqZwxbQejegaE3vSDjl/2x/ku1ez5abRok6t83gD0KZvYCVji/Fh+H6NAsCBbHG+4WEXQSFHaAaU3ulJDDBKWCIYU6d2168B7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZCnuhzoGS1LwWehGZn8lz1fDjC6DAWP0qjhiP7KRh8=;
 b=eU1DooiX4ZdfuUbk/p2AG06gwyRK8cX0j2HLokj9l+xSi5j18fh54XcE0jqiItHtLJllt7YKBqnYTXPhHz7Lt2qaRa9DV74ofGRlr2fAn0eUdBU2GQ/b9lgSb2o7N76PwRkuIrcWkJP/Sla6YmLMSecAeTcHVQSw4Lk5AsBjQbcsnpHsxNhBTJgqt+RETOxghVvo4bLkZtzRtu1pqeS+yANQnyGj+jLgNnxNbVm3vfJ+l28O2pJmuNkkLCLeklTJ4Fc33fy3nd2MP9ejJI4i3LJORpHKKqfAwSWzzpwYahh11DXsoebYcm1DgMl7TEDo+7K3cAQatgWWY+yHul8Hvw==
Received: from AS4P189CA0041.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::15)
 by AS8PR10MB7873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Thu, 29 Jan
 2026 10:35:11 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::41) by AS4P189CA0041.outlook.office365.com
 (2603:10a6:20b:5dd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 10:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:35:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:36:53 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:34:53 +0100
Message-ID: <b5746936-d6e1-48b2-a366-561a02a12d42@foss.st.com>
Date: Thu, 29 Jan 2026 11:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
 <82b9a728-ac40-4891-b926-42c60bebaeae@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <82b9a728-ac40-4891-b926-42c60bebaeae@foss.st.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|AS8PR10MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: c1166968-e3c4-49ad-62f1-08de5f2214b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVdjNzhCbTlkSjh4ZlpwNDJVaW5wVVNCVnA4V1Jpck8ya0VsdVRiaFcwc2xU?=
 =?utf-8?B?NUovSDUyakFlVUxFV2tESE5ydm5ETEorWWFrdGwycGpMaXhNUHI3M3JLdkpy?=
 =?utf-8?B?akVFWk5neE5UUE44Y2dTSS9hU2dSN2dhSDFQeWI0Zjg2cGtKR2NIc1hkamo3?=
 =?utf-8?B?Y2d2L09UL0tKTEllTEQ3QzhaV1Y2aXFuSCt1aURTOUorSzV1aEI1VDM4WGZV?=
 =?utf-8?B?SCtBeXM5R2NOVk13Z09Oa2dJZmt5elgzYkFNVkZVclFHeitHWFBMQ0VDdm9W?=
 =?utf-8?B?d1FZcVRXR1V0ZWVhS0k1Ky9zMWxJWDVzT0oyVnhlZGZySG5FRWd1RnlsMDdl?=
 =?utf-8?B?ZHo4MEE1Z3hEWkg4RlVLRU92MlgybUd0dEErenlNRDdEQ0VPNjFlTFBiNjR2?=
 =?utf-8?B?VFBhdWxSaDNwM2dLTnBHVTVZMHNVK0JJZk5STC84aTBuTFVVazY3Z1I3VmNU?=
 =?utf-8?B?ZlNWTU9aUHVvdVlhcVI3ems3ZTYxdW5nYnJ0YVpxOFBwZW5iMkhrSUFMZm1w?=
 =?utf-8?B?R291aVg5eVBXZENnSE5QU09QQmJoT2I1Smt2MFIzN3Q1MDM0eFBsSnM2WExx?=
 =?utf-8?B?TEY3MVRmTXEvVWIzTjlQKyt4Rk1XMko3Rkg3YUN3QXdhWm5HSHdQWVZ1WjJ1?=
 =?utf-8?B?U3FCeUNLM1lNK1piS09QcytMSWpveTVFMkxVUExXZ3BDek5FYkhiS2w0VnZP?=
 =?utf-8?B?QWNxTWNtREFBeStSdjR2YktlQ1RZaXE3a0tsdzRqaUtSVVE1aDd6OGpGZGFE?=
 =?utf-8?B?OG9zUnNlT1l1NzE1MkN5SEJBOVkrcytpakJzVytWQVQyWXJqVVJLeCtiZEJO?=
 =?utf-8?B?d2hiRkh3ZDdYck5iN2JDeTdObHV4SnFWaWhYemQrN1JQMU1YcWFSYWdwTko5?=
 =?utf-8?B?TVk3OXY4TFVHTXVoWnhtRUE5WEhQSnNTb0txd2V4TXNCaGVMNXUwZ1NoekZY?=
 =?utf-8?B?c2ZiakhHUjFkdFR4eFB5cVNPdU9uTzV4cHRMUU1WZFJmWFErb0JTU0ZaUGdL?=
 =?utf-8?B?M2VyMVkzSXREVFkyRXlNbjYza2FMb1ZsK1E0cjZLejNwcjVZZGtvWitrVk1j?=
 =?utf-8?B?RXFGSzI1d0xYRUpLWVVIazE3WkJISFczVitrTk15YURsbjU4b2ovVzYvMThZ?=
 =?utf-8?B?VjIxRVVXeG15eURDSnhzb2JzemlzaTA0aEg4WUQwTEwvYTdpSnVNMDFyNjFR?=
 =?utf-8?B?M3JMb3ZWZXlxc0VIWFBJWGl4QUVWRW9QL0ltK2FaQStvRm9YOTJtSGx0RlBR?=
 =?utf-8?B?ZlZNV080Wjh1VzRRTFRyd1M0aHZNbk1EaVplWUVMTGdxN3J5cTVMV0lvSzZk?=
 =?utf-8?B?WnY2SHpta0I0dEI4NS9UaVBKZWllcUdxSDdqQ0NmVGh1THNHRFdMdVdnN3lx?=
 =?utf-8?B?SzdXOEhibU1QU1J4TG5SQXdKVDY0YS9HSFBhNTB6RzhOaG9UQXdrMTFaanJP?=
 =?utf-8?B?bDJlT2J0NnRnSHk4QlNLWWF4dElTcVRmNXFPWjZZdjFuTzFXZ3ovQnIwY0xi?=
 =?utf-8?B?cHdlbCtqRkQyNVhpRTZmY0ROTEQ3TjdEODlzUzUwQmtTSEVhWW1peGxrZEd2?=
 =?utf-8?B?YTQ1SXBjUDFmZnpscDdrWUpsZzJveVJpNWg0NFFJMjlVZmNiWWxTanhsbE05?=
 =?utf-8?B?SUdCSDRLUHB0b0l1UGFmMllURHI2V2xMeUxVcjVBUUtodzZLSGpKdmFYT0Nn?=
 =?utf-8?B?TFlBMTlMc1VRUzN3Q0dNTnN5WFM4dDEybkZtY3IvYlVraGhDRVRKRGhBckEx?=
 =?utf-8?B?M3lkU0hkU1M4dUFTcUFwdHYxdzVydUZ1ZUhHbVdCcU11M2pnR3QvZ3l0NjdD?=
 =?utf-8?B?bzdqUExZdS9yZzBLblpaSWFUQ29oRFJ5WVNiYUErMDhTNTJZK1d4VXROYU1P?=
 =?utf-8?B?TEhnc0M1anpuekdTZXFJenIvUnZ0VEV5UDVJNCtCSTRVTG9CVHVPbFJ3RGR6?=
 =?utf-8?B?WFc4OElpMnVaWDhCN21qbXlSQkdrMENzTkJ2WWhpbDNhR2JyUE5uQlR1YWhn?=
 =?utf-8?B?d2RMUEVUNzd3bktTbzVlNHFSSjVINVUvTERXaHR1MGR1aW04aDFNcWlnT3BV?=
 =?utf-8?B?akxsdHZWbXYrNkJ1a2g0V1lQM0k5SWJUNTRwWFBQWXRScDdBRnQzbkdvenZS?=
 =?utf-8?B?VXgwZFZPMjNHU1M5TXBqaXlISkJrbWdZZXorQkZHVElTNTdxMmE4Ui9UTG5u?=
 =?utf-8?B?L1lIZy9zRmgyRVEybU9RTEpNQXV6VmdTb1hqQ3R1UE80aWNsTVNKWHhrb0RG?=
 =?utf-8?B?NDNtQkFRamp4cjlkOEhobWR1NDl3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IgBCXLx6tx9Stgv1hqVXeCdNyL56vJMGErs85EfwLU3NSyKHoobe+vifIBK/xkGIaxLmqWXSEeuqE5/8D7O9pW3ehDtmt3jW3xx4nO0JWdecyVxt2VheaseGPSd0RVC6qK5lwQJjwTFfUIRqZtNa5SJqJqNBxHl5zn1BEVlynNkvHS7doRxjoy3mOFg1vf6iijoFaIBEJLNC/kM4OpHJNmuxAj+u/71+royAjtb9O/aEETOalTQaQMNEdJZuEdRxRByG/rb6GMjbu95S2IXH7llWl1KlDSolxrtwIi3fBF8HQgEo+XLwsfffXR6waNJB8xfpWBlmAutfb4JPgMsNAldJ2kUuo2fJF3caEMshq6tEDQlt9zN3C045nZCC6voxQZ6SYOuMXArYZwdvfE5iKMUEh6j+cClU8u4ypGDxoIITPVawoIGxCbLfGcjIkCD24Tc8u2j54C7LxqvvjpgJ9YxNR/WImbtTiiV6A5xS5X0ZjA0y+NLhRChNu0nVQ6FTnwyQ+fWSOUwDNWJbaNy2Sx4HcGqC0T2+yXhLHRD73ycOykCIGdwkYpiwrfGIigXXo8Cx2gZgu2614AludzlvMh9G9KtcJtgW36Oq2oVL0AgaTH1hcznF1bKblRYX0cgRrnd1epHsS6sQyWzw8qj7hMhmWgXxM40Lt4jGuM7lxh+hpOzV01+oeCDOnmW2H9ALq2WWivbfMbZr1Or5T87abg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:35:11.3265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1166968-e3c4-49ad-62f1-08de5f2214b5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7873
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:quentin.schulz@cherry.de,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid,stormreply.com:url,stormreply.com:email,2.220.147.16:email,stm-ict-prod-mailman-01.stormreply.prv:helo,2.130.23.0:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88378AEF5C
X-Rspamd-Action: no action

CgpPbiAxLzE5LzI2IDEzOjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
MS8xNi8yNiAyMDoxMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBZGQgYm9vdHBoLWFsbCBw
cm9wZXJ0eSBpbiBsdGRjIG5vZGUgaW4gc3RtMzJtcDI1N2YtZXYxLXUtYm9vdC5kdHNpCj4+IHRv
IGZpeCB0aGUgZm9sbG93aW5nIGlzc3VlIDoKPj4KPj4gVmlkZW8gZGV2aWNlICdkaXNwbGF5LWNv
bnRyb2xsZXJANDgwMTAwMDAnIGNhbm5vdCBhbGxvY2F0ZSBmcmFtZSBidWZmZXIKPj4gbWVtb3J5
IC0gZW5zdXJlIHRoZSBkZXZpY2UgaXMgc2V0IHVwIGJlZm9yZW4KPj4gc3RtMzJfcmlmc2MgYnVz
QDQyMDgwMDAwOiBkaXNwbGF5LWNvbnRyb2xsZXJANDgwMTAwMDAgZmFpbGVkIHRvIGJpbmQgb24K
Pj4gYnVzICgtMjgpCj4+IHN0bTMyX3JpZnNjIGJ1c0A0MjA4MDAwMDogU29tZSBjaGlsZCBmYWls
ZWQgdG8gYmluZCAoLTI4KQo+PiBpbml0Y2FsbF9ydW5fcigpOiBpbml0Y2FsbCBpbml0cl9kbSgp
IGZhaWxlZAo+PiBFUlJPUiAjIyMgUGxlYXNlIFJFU0VUIHRoZSBib2FyZCAjIyMKPj4KPj4gRml4
ZXM6IDI5YWIxOWMyYmVhZCAoIlN1YnRyZWUgbWVyZ2UgdGFnICd2Ni4xOC1kdHMnIG9mIGR0cyBy
ZXBvIFsxXSBpbnRvIGR0cy91cHN0cmVhbSIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9h
cm0vZHRzL3N0bTMybXAyNTdmLWV2MS11LWJvb3QuZHRzaSB8IDQgKysrKwo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMv
c3RtMzJtcDI1N2YtZXYxLXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyNTdmLWV2
MS11LWJvb3QuZHRzaQo+PiBpbmRleCBiNzBjZDhiNTJjZS4uYzNjOWM5NGYxNjUgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjU3Zi1ldjEtdS1ib290LmR0c2kKPj4gKysrIGIv
YXJjaC9hcm0vZHRzL3N0bTMybXAyNTdmLWV2MS11LWJvb3QuZHRzaQo+PiBAQCAtNTIsNiArNTIs
MTAgQEAKPj4gwqDCoMKgwqDCoCB9Owo+PiDCoCB9Owo+PiDCoCArJmx0ZGMgewo+PiArwqDCoMKg
IGJvb3RwaC1hbGw7Cj4+ICt9Owo+PiArCj4+IMKgICZ1c2FydDIgewo+PiDCoMKgwqDCoMKgIGJv
b3RwaC1hbGw7Cj4+IMKgIH07Cj4+Cj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogMWRhNjQwY2M0NmFk
ODRlZmI1N2JiNDVlMDJkZDZjNDAyNjViNTQ4OAo+PiBjaGFuZ2UtaWQ6IDIwMjYwMTE2LWFkZF9i
b290cGhfYWxsX2Zvcl9sdGRjLWM3MzI4Zjg2YjE2Mgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4gCj4g
Cj4gb2sgYXMgYSB0ZW1wb3Jhcnkgc29sdXRpb24gdG8gYWxsb3cgVS1Cb290IGJvb3RpbmcsCj4g
Cj4gd2FpdGluZyBzYW1lIHBhdGNoIGluIExpbnV4IGRldmljZSB0cmVlIGFuZCBEVCBzeW5jcm8u
Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1z
dG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
