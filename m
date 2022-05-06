Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904251D39B
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 10:45:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1719EC628A8;
	Fri,  6 May 2022 08:45:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0AA6C6047D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 08:45:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467Y0n1015868;
 Fri, 6 May 2022 10:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iQFCZ40LVGcDTxl8SAW9xHoVk6qQiIENm4T4s18n15M=;
 b=BFZWcxPSMgiBlWzVPAjPy6wVxZ0MIC3b9sq7pmZQbcJ9hqjweyB2vhioq18mRVui21w4
 aWXDl/kKKzSwSWkba40AVpXaFSAEOYW/rR6NwcU741YTBX5KKXya6M12EJHojtPlb9Nz
 sK7RSDtHeD5G83jDhijaELZ5BqkSGozNk6ixwcSTfkP9owG6i9T2pjP1j8O3vf+bUqSk
 3I7lppwb24irPdiwuhcV1ZI+lBrQ1dmGDynPwkyyinhP/MkeqQ/356qiE0DPXjCaNjAt
 s2J7d456KgBZHwcTkwxug04xW1bYUfHKtF4kMt2tSbEcbmQf8wSlP1J50prRmI/tvhF3 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0ym8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:45:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB0BE10002A;
 Fri,  6 May 2022 10:44:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B530A21514A;
 Fri,  6 May 2022 10:44:59 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May
 2022 10:44:59 +0200
Message-ID: <f0acbba6-45e1-e8f2-3a2b-49f81b7773ef@foss.st.com>
Date: Fri, 6 May 2022 10:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506082232.v2.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220506082232.v2.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] usb: host: ehci-generic: Make
 usage of clock/reset bulk() API
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

Hi,

On 5/6/22 08:22, Patrice Chotard wrote:
> Make usage of clock and reset bulk API in order to simplify the code
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> Changes in v2:
>    - add the error code in all dev_err() output.
>
>   drivers/usb/host/ehci-generic.c | 103 ++++++++++----------------------
>   1 file changed, 32 insertions(+), 71 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
