Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFWVGAWgnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:56:37 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9D1874B1
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:56:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93903C8F286;
	Tue, 24 Feb 2026 12:56:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011025.outbound.protection.outlook.com
 [40.107.130.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F6A8C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 12:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfCv73US+D26w5CG8K6W1Jq8YEmvzTqRCEx8+SYn+qCiqBRWvCxl1mJDrepOHscfH09qJ+nyMtIELUQBaOnrw6iDUmwWaRKtwi4xWpkqr3xS2g3hQWBYVCggC4Ub0oW8GDX7MA9D7YfVm1FQMLTf5hu2cuiU2KjfogqndJqA8V4VKveDzCRldFJPh4+/IMD3wtLuXvVnaJebenQrwNVXDJRdGHdNwH53VPXdaC9IR+EEUCw2YLHzSSylLtUGYIWon/QkYqpFvOHinAi6Ktm5siDBbi31KRFhjqF8Nx2iPTA87f8bV5swNDD81ZsMwg+UqZt30Rtivw0JzkJ8bt6+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIiZd1s7FB+OgXqYA5lp0OR3Y36Pz/juaaqoavoSpQo=;
 b=VTYW0xTNW3cy+aCgl5F3HjXCfFwdOoiixDL46k/WGaSUjRKUfSVXzy6S+T/vxl40ZCINlU1fX6rFoLys9djRM21+MU9GOQuKLUIL56UxKGgcaQefqtwHDaS8yRzfZqnK0YwngS6JUwTyGnPafAZidR9OpXNzacPD6M9oukGzJjzeCm1jL7+ahdThXuAcSqYaLhgpsoii+5840BJ0le7PzsCQIqCrFuyGFHAZxPsAihpFZdmN3v2AEJ6t91HWfz6HGLU0lbJW3rfd+h+VSxPFdxHCfihPJ8u4S/qyBpApvSke7/IflL2oLhgDU9We9LvkgM/uONxnDWH5W2iY4nKXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIiZd1s7FB+OgXqYA5lp0OR3Y36Pz/juaaqoavoSpQo=;
 b=OWY2mBcymDoT6wrFRqpRENO1R+niPNrQF98tavzzMVdcW91sGqG2Xbz5xHpt/NCBGTCxpPmzL2PQH+IHe6Da8lr0AqU7smCv6hyv6J8HHofedcacCH85yEoV7hBtEpo041uRRxwaytJI9ArDTLA02gpMCvCrcH+SNVT158/sb/jEhc4YzIuWBhXcxf2fkTwLWOqGzGC1j1dvaVFC8X9tiFo1EdJgdbSjKEiyCZNqLjAxU2N21EsQn39JFier2ADjTWQlcmzOZRfFDKHCsx8vdWOVrEPwYg7XeVqkF/yTPUzRrC/ZubkT1UUHynPyx/9OhXCp+f6c9oCrMRhPFXjDHg==
Received: from AS4P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::15)
 by DU0PR10MB6931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:416::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:56:31 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::52) by AS4P251CA0006.outlook.office365.com
 (2603:10a6:20b:5d2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 12:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 12:56:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:58:37 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:56:30 +0100
Message-ID: <584c4aa5-e7b9-4c90-8cc1-7c4f7c3477e9@foss.st.com>
Date: Tue, 24 Feb 2026 13:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
 <20260204-upstream_factorize_and_update_read_idc-v2-3-7f0baa41d2f1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v2-3-7f0baa41d2f1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|DU0PR10MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed561b6-9472-4472-8e90-08de73a421be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0RJM2NZSmJSYVk0WnhSdVcxUWFwRjkvSjFuSEp4Y0VxV3hpRHlaNUg2YkNQ?=
 =?utf-8?B?U1VIUlBtTG0vbDU0YXpSSkh1WXo4S1ZrQkJtVGo2NEcrOS9kZDBURlNyUDYw?=
 =?utf-8?B?bzRsRTVBaHRwa2hwSE1kU0p2QUdVQjVvQ1IxVkxWZ28xbENpZnIxeVNpUzk3?=
 =?utf-8?B?YWJzU1BndXhtY0ZuMTNQSUxLdmFWN2gyRmZoTlBicVVFL3JwLzBqS2NxRnBR?=
 =?utf-8?B?ZzhGK1F0aHBzUThXcGFTQzlDUE0xNWZrQ1VubG91NFludDZsTE1IeHFpeE9J?=
 =?utf-8?B?WnlkTzhTRFAzWERKZVpFczJZOUNJVlF6ZE1TV3VQcnRtZ21wQm52NERHRFIx?=
 =?utf-8?B?VThEYVpzaEVsOEFtTktKcXFIUzdpdDUyVU94aTQvRlRDSFFra1BnZEUrcXZF?=
 =?utf-8?B?LzY1T3ZiYVpNNzIreHFiVEtBL0pBWVM5bkJjN0ZnU1dVM2JBa2t4dStQSXpt?=
 =?utf-8?B?QlB2aHZwbzZwdU0wcjFLTE1IbCtQMmw2Njg3K1RxWnhQMEJEVkYwSHlnMWtz?=
 =?utf-8?B?YjllbkxmVnMvYXl5VFZoRituOGFoQnpjYnU2QSt1Zm9ZMWZTV0Z3WWpQdE1t?=
 =?utf-8?B?MUw5QzBYOXNLMC9TcjhkZDNBRnhFbTMrS2t0RWhZMnJ6eUtjWS9MSjVkdldm?=
 =?utf-8?B?am9zdnpMR1p1RE5MdFVIYjhBNTMwT3o2NWROR0MrRDg3SjBUaDY4ZFJocyty?=
 =?utf-8?B?b2Jsakp1WTNOaE9mam5EcXpzKzU2MXg4Y2RCSFhSZUs2WnAvTm5JVGJudmRG?=
 =?utf-8?B?OGpwY3E0dUdCT2FOUnp3cTdhLzNhdWYwMTNtTGR1b3ZxQ1RUa0pwOTA4dmN0?=
 =?utf-8?B?bXNWVTdzMHFWQVMxUnNLVEQwQjBHdVp0MW1CLy9mYVhIeUtFU1lrUlV5ZDlP?=
 =?utf-8?B?cVQxUmdmQmtyM1VGaTYyYmxRZFJnaU42VXVGenZHMHRXNzAwN1Q3Yy8yUThl?=
 =?utf-8?B?d2YzMlF4Q2FWQXVvVGU5a1VLS3Z1WnI4aWxRcUNvdUc3bS9kem9WVnFyLzZq?=
 =?utf-8?B?V2pIMmFBUW13cUg2Z2t2Z29ndWMyMnVWK3dPRGphdkcvdTVoS0tPNXBVTjRw?=
 =?utf-8?B?VEMyMW9hb1NuUFZpQWFKNEdnZ08wVEJzNCs5MHAva2JaRmJPd2R4NW82RzdJ?=
 =?utf-8?B?UHlVMnR4cUU0MlZkaVhpZkUyMjJPSmd1MDhSSXVaeFhvSG1HeE8xUnVKNkRl?=
 =?utf-8?B?WHp6QVIzSko1djJEdnlnNEM3cFlFMldSNWhWV2NNZ2VqVERNRlFJenBVaUFv?=
 =?utf-8?B?SGQwcDV0QkV6TGlLUENxRzZaMGh6VUM2ZDRQeFVFcGlGeXBGVDRwdHZXOUpK?=
 =?utf-8?B?RlRVU05MVVNRQ0ZjNlMveVJ1NWpSaWJVeEYvNGhJZU9hZzV3TVdoY3Q3WmJo?=
 =?utf-8?B?S05VNXJlZ2lpb0VNSEFLRlZUY3pyNjBSQ1hLSll2TFFhL29YZVdRNlk3VEpv?=
 =?utf-8?B?RzlraEY5TUQ4dVdkb1dwTGhiblFKa3MySXpiRFR4NXpSSVF3aFVpUGpkaWNK?=
 =?utf-8?B?OGZtalk2VWxvajF6VkNFTURBSjc5SE1pczFjZUZocklPcDhFdTloYVJxREMv?=
 =?utf-8?B?bXVYeHR4VXZxTVhLc2FXL3BndE5YeWpXV2RvNDRJbnRGc0VodVVHUjUvL1FZ?=
 =?utf-8?B?OTN3SHRVd0cwVEh5RCtXU1QvU0FyeDZSTW9kL213NFEzUHBvSzdZZ3lxR1Vw?=
 =?utf-8?B?RDJxUmJjQ3pjNXNyb29IUTd6K00yL2JvTXpsbnY2am9oc2JDaS9ETkFDM29K?=
 =?utf-8?B?K25oZDhiODZ5ZGM5RSsvbW55bkZvZnBwNjJlZEJvVTU3aURtc0Z3dzdQZ1li?=
 =?utf-8?B?SEptM2hBbTV0OHlMWG1jVWdaV0IrU1F3K3E4bVV5SkVVbkZqUFNKa1pJNTh5?=
 =?utf-8?B?dloveXd0UDBITEV2WERHUmVsa2txd3F4cWE5aVV0a0lMNGlzVWs3QWNlMStB?=
 =?utf-8?B?RTRRWmZnS0lRUkV2VVRNNkNjMitvV1UvTmFwdUMxcUovUWE3amVublZGd2NJ?=
 =?utf-8?B?SzNMaXJFV2luajh5UHpHMmwybm9tVlhjMjUwdDRubTUrSUpudzFOaXhmZWYw?=
 =?utf-8?B?cVNqdVhWeXBOZ0h0ZUx5YmhHd2pheXZhcFVLcm4vMzU3QU1rSjllK3FNVWRx?=
 =?utf-8?B?UU5xU0tYeFZ5VUhiajc1QUpwZ25JQkkzNmNRN1NDcnpMMWFNOENGL05JWkdG?=
 =?utf-8?B?c2xJZElUUTQ4WEVaQ3Ezd3ZIL29KclpSWEMwRm1pZGlaaUI4WmJTeVN6QTRH?=
 =?utf-8?B?Mlh0Vmtxc1FoZDg1ZCtVUWJrbUJnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QMCmiXO13XslDQNb3CJTYI8NU/8ddO+xDAZ/4POMC8WlY3d4Ryjoe8dQyOEuWVK8hGSbIqMmvWGuq25+ko4GYXefyTR4ZIh8VnHiPY/th7XmXmAHzpPbk5yJ2krpriTiqks0UGPhkndzeuI5iKHTCYD47m20BKcV0lrltfmZ4QKtGtFGynIo8w+X3U8b8ZS0EjS/2UJ52y+MUvyacV3O0bY59pJA2d8EdQSUcUN6rpN1E9HOftZtwLpdXsFSsFnHUgmf9V6OOxzwR9C+BVm7i0ojwvl9SGlJFkFLp31uzmcFu5Ff84S8r4bVhmisrfz6t/EofPvPv52ur6U+2VFP8X956l9qTRg/cptV7XCcfE8EgSUUKqM1UKTjT6Ls50UJ9YWlGx8U4wRvxvUL4v30NiuhROBLS2VSC56ztQeMqF/Hz+lwAdGQFZLZNjIyEp/g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:56:31.0263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed561b6-9472-4472-8e90-08de73a421be
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6931
Cc: Marek Vasut <marek.vasut@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] stm32mp1: Add check on
 syscon_get_first_range() return value
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut@mailbox.org,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,m:md.asadullah@eds-india.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.833];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DC9D1874B1
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:16, Patrice Chotard wrote:
> syscon_get_first_range()'s return value is used as base address to perform
> a read, without any checks.
> In case stmp32mp_syscon is not binded, syscon_get_first_range() returns
> -ENODEV which leads to a "Synchronous abort".
>
> Add syscon_get_first_range() check on return value.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
> index 79b2f2d0bba..6d2d69f3442 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
> @@ -17,6 +17,7 @@
>   #include <dm/device.h>
>   #include <dm/uclass.h>
>   #include <linux/bitfield.h>
> +#include <linux/err.h>
>   #include <malloc.h>
>   
>   /* RCC register */
> @@ -231,6 +232,12 @@ static u32 read_idc(void)
>   {
>   	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>   
> +	if (IS_ERR(syscfg)) {
> +		pr_err("Error, can't get SYSCON range (%ld)\n", PTR_ERR(syscfg));
> +
> +		return PTR_ERR(syscfg);
> +	}
> +
>   	return readl(syscfg + SYSCFG_IDC_OFFSET);
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
