Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C47021A7B8D
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 14:59:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7039BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:59:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87CB5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 12:59:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ECrAsU020067; Tue, 14 Apr 2020 14:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dey9a2wxlf+ozGC5f6hQFaBA8MFM5EbBdBXlnorynQ8=;
 b=Pdh70i7hoE/+PGGW++r7iDBnr1eJfiMW7MhiFFYaKoyVCP0PyGy92BUzm+aO0owKErSY
 HebbnVgSKOuLxX12q/S7FgfKMG9rpWIogrk5qwmPS84bdJipW9I0tl/RJ050+xHUEo5I
 7QQqblHS8eOZaYZiD6gC8JuyQLkmUrpNBLTuqw9UlnacCLybN7sJWJhr8by6mkYopBAA
 RNqOtbLcRoShfPBsJ87XjqHKEkIxX3j2sfX9LOLU62+eTFJ3X8wn4Is7EAFnKp3dxXnn
 eLaHpA29QkAgIlQpW89zFYDP/XB96iOWZ3ydgEqefprW3SDaS9165zPSF05LVhfRHa0w rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdrxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 14:58:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AAD810002A;
 Tue, 14 Apr 2020 14:58:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E8E52B0FB0;
 Tue, 14 Apr 2020 14:58:10 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 14:58:09 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 14:58:09 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 02/18] dfu: add prototype for
 dfu_transaction_initiate/cleanup
Thread-Index: AQHWElxZ6G+CGUTzGU2gGvqzB0gXSQ==
Date: Tue, 14 Apr 2020 12:58:09 +0000
Message-ID: <944c8855-bf19-5437-250a-bce1b73ef2fc@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-3-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <9D6B2C8039774F4C902B9555D8846318@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brad Campbell <bradjc5@gmail.com>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 02/18] dfu: add prototype for
 dfu_transaction_initiate/cleanup
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

Hi

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Add prototype for function dfu_transaction_initiate and
> dfu_transaction_cleanup to avoid warning with W=1.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  include/dfu.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/dfu.h b/include/dfu.h
> index fb5260d903..2f0e335ec0 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -209,6 +209,9 @@ void dfu_initiated_callback(struct dfu_entity *dfu);
>   */
>  void dfu_flush_callback(struct dfu_entity *dfu);
>  
> +int dfu_transaction_initiate(struct dfu_entity *dfu, bool read);
> +void dfu_transaction_cleanup(struct dfu_entity *dfu);
> +
>  /*
>   * dfu_defer_flush - pointer to store dfu_entity for deferred flashing.
>   *		     It should be NULL when not used.

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
