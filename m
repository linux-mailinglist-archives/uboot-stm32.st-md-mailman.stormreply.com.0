Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBTJE9T98mmIwQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 08:59:32 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CEB49E4D2
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 08:59:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8740C8F262;
	Thu, 30 Apr 2026 06:59:31 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 305C5C87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 06:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdfhWWtXVpDocjx2ueM93vaDj+ebx3FPODd4GV0uZbnGkjbC8Lh5D9HnYxNG5q3Mv+KOgNG8cSTtMFHwYJ/9HRPLv7vsf07ugC9QqMErB7uHmboUZDI/QDrhJcm3VCK1+vkPqJKIQi9atRIoFOnaym7UG74xJC/opSYg2CtysFTMKSHBa70T1ZeOD8cEXcG/2B5E07SVUXK90Lb4N+Q+fwnqKt4Q3Sxe2dwW5qc8s/4WRAto4/Id5psDaW+Ly6ZnepvG5sZIVcH2HKOn5KrXZc4ERjW7KMfain8nitkfmnhjzw/yc4GQxHgBsJjuLTnjn0CT9XHxzjNKhWr4i3EH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJM/bD5EIupNrZ07eGTzn2cNyP6a/5uNcsChONKEFd8=;
 b=E7wrTPs+vMjIBpVoebsuuCyWq3lDi0nCGUqXOuRoxLiIGY8PdZRS31fAbCWBbPSzeu3lCBT8pkua/agfAlfIh/a7EnGFGplx3eZ8fOYm5Wq1q1xNLkejY//oAFO2hKM4M5C3leR/wwubowHByWGsoxMBZVm29MJKTD6bYVYj2bWjsTOcuH5t0M6/8c64euUb3SjSLCZJkTML3l4AidQ4VcDzdEZO42KmDCCpkL0XXfSeSOSMZCZUr4pRUjl51e8OkUvMIVKrx1vABwwoRkI5is071W4l2RNcI2j+hfYUzXO7FziIfDA0VjZwhtqIBohz2gf8xJwsHVCDMkdYsiLWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJM/bD5EIupNrZ07eGTzn2cNyP6a/5uNcsChONKEFd8=;
 b=XvqKaDVfHfMvrGBM84ZqXH5y8FrenMbJh4ijriXAlyRR5+E9W0qxaJ6sNWAjFpLfoieT0M0oHTM4s+z91e3DmolqEfSihvVYbTqr3bqVNYwj9HXbjQd7PTs6hIUNYaP08XVU/a2Y5M2oWbip6NlkCAORBOIfXpmfu+vfVrzj8QDX9+RK95sD6D2zEXhH6AtpbN8PO1ZYz5mdf1oOU+ec2A/ovTVod11I85mo9aYijJR0BlwhPGZtuQQBZXAFrCNxjyDs8VPatIPXrhGiMK0wuSZQtcLt2kyUk4UIn8R47UNqX6TAQOGB2BvLirk3+SO/uzk2tunW97MKT/ExI/TR5w==
Received: from CWLP265CA0400.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::10)
 by DU0PR10MB6201.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:59:27 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:400:1d6:cafe::3b) by CWLP265CA0400.outlook.office365.com
 (2603:10a6:400:1d6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 06:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 06:59:26 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:02:59 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 08:59:25 +0200
Message-ID: <b2ee1f0b-9999-4c88-bb4d-8310eddd9607@foss.st.com>
Date: Thu, 30 Apr 2026 08:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>,
 <u-boot@lists.denx.de>
References: <20260412-master-v1-1-d7a8e742233c@gmail.com>
 <848b503c-a908-4ad2-8d4b-560f3e0ceeaf@foss.st.com>
Content-Language: en-US
In-Reply-To: <848b503c-a908-4ad2-8d4b-560f3e0ceeaf@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B91:EE_|DU0PR10MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f2f7f1-aed7-4f15-7700-08dea68604c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: aIwScAz3TTWEUKxuzXjgXY1rvuqHF0ix7hZkPya8TLswBKLv5d5VhfRed2YW+Bea22Qn4cibR7lue0Bk08fl5Me6+e21z/CFjCP9Xm4Umkm9XVmPTNWBRcggLSYnTGyK/DlhPvlftPJWHGd4zRkrWFG13z1N7vuU3Bf/lCCL50bMIr1DXCB59acZHW5mslfIXk6nS1jszreWNgZykyHnVD2Ywn0cHIDw9/aLVBGHUeFCA2rUI2Wi1HYqtRTLNcw2mMCWqYHKU1+SukNfE7plJvEMkfpmMxOLne2ASh9/pgV7EJYSkvdS7/wQBFpMjvMcMLZQPg5ldueEz5tOfpmwLfxwcS21b6qg+nH7i6V1YoZgUH+0y0u00rLagQh0D9XAYistXgNtKLeAJ4o8icZ8eYhuogp+MTWtEk1Eh2cGTx1ymcZuHSyEB14v2YzNjAJs/ZTA1kJrzzi1hURzW5qPrZNqu10et2CD0BYaWhIsZfi0fZz2VKOPVh0qMLqctZ35XgbVeH8pwIbry+FtxZ9IQWctmqFz1WlNKIS0rxMjtVR3dm2KWZhaHENxsFoVg8Ks2r7ucoisY21RKJzPGi6tnM24fXIGYgZvhqjV5oPkGt8lfSwexs3YtEt/FuamAodHmIHEbokNxGeDEUbDfU0OQl80Dx7c8Vp+SV9e4hFfSiagjrXrpr4XqH+YYDMAggpyVncC8121GbHDCmaHDvVn9RiXsrg4P8cAfm3TDZzXESkN9zmHTKJZxzC5U0XdyHeMclGlRH4ijWubCvPZm4hTjQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sTyMxgL0eUa7JWhpB8q0IalE/yEAZ8/ka8OjCxDmwOtlXSBMmQb450xEOS07VeHSt3rVMyhEnqWOv+pyyQxnsAdqwbqDF9hguydsCyuPeEh/pUVADXJ0HuOfUNgn7p1Go0eIVOsDwTQTdqZUkZnDvbW+72t9kpyFkqdhP+X5QlE1lGTpPRbLidWwunO2LY1KckQIK5KipIfqyzgAqe0ebjtoPhcZ1ViyzJANUrALTTE6H2AJpu78wA+OBSfi3Z2HUZrRKV85NWodb01DGJybntDifxPu8aeaC0OD5Zr40Tq7w2p3E4fSNMje6NuXb4qJaQnhGlk9S6vmI6KsO33yvJIhBieMldhIsjhB+tix5zBJeXWaerkYC7JpVfAvAagALnZDVsqj7IIi/81EYqBfGKLd+Ikeg9GpthI2X9P+J1f0C40tLdiciG+wzqPJ3DUm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 06:59:26.7871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f2f7f1-aed7-4f15-7700-08dea68604c4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6201
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: fix unchecked return
	values
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
X-Rspamd-Queue-Id: 11CEB49E4D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.denx.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.990];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/26 09:06, Patrice CHOTARD wrote:
> 
> 
> On 4/12/26 21:07, Raphael Gallais-Pou wrote:
>> Fix the following errors yielded by Coverity Scan:
>>
>> CID 644836:         Error handling issues  (CHECKED_RETURN)
>> Calling device_chld_unbind without checking return value (as is done elsewhere 6 out of 7 times)
>> CID 644834:         Error handling issues  (CHECKED_RETURN)
>> Calling device_chld_remove without checking return value (as is done elsewhere 4 out of 5 times).
>>
>> Link: https://lore.kernel.org/r/20260309212331.GF1388590@bill-the-cat/
>> Fixes: a6d047c0a86b ("video: stm32: remove all child of DSI bridge when its probe failed")
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>>  drivers/video/stm32/stm32_dsi.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
>> index 65a91f5cff7a..5c4d8d2aab51 100644
>> --- a/drivers/video/stm32/stm32_dsi.c
>> +++ b/drivers/video/stm32/stm32_dsi.c
>> @@ -493,8 +493,11 @@ static int stm32_dsi_probe(struct udevice *dev)
>>  	    priv->hw_version != HWVER_131) {
>>  		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
>>  		dev_dbg(dev, "remove and unbind all DSI child\n");
>> -		device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
>> -		device_chld_unbind(dev, NULL);
>> +		ret = device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
>> +		if (!ret)
>> +			ret = device_chld_unbind(dev, NULL);
>> +		if (ret)
>> +			dev_err(dev, "Unbinding from %s failed %d\n", dev->name, ret);
>>  		ret = -ENODEV;
>>  		goto err_clk;
>>  	}
>>
>> ---
>> base-commit: e2fa3e570f83ab0f9ce667ddaec9dc738bcf05b9
>> change-id: 20260412-master-8be67866e096
>>
>> Best regards,
>> --  
>> Raphael Gallais-Pou <rgallaispou@gmail.com>
>>
> 
> Hi Raphael
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
