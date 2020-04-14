Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787F1A7B88
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 14:57:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAFE6C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:57:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5654C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 12:57:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ECrAsM020067; Tue, 14 Apr 2020 14:57:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GAQl8RfzJDwTnetGjgChjD3WNirCQz3k7cq0p268yfU=;
 b=VnEU7VWvtbSqTuLl7+zOopJCfAFJRZ81yk0DHrCXiGoMV/x/RZV7EW5mBMub0SHDNHaZ
 9CxtqfwH7QeuZfPJMXdPbgIWnlqhgOHAyrlpCkpL2wBOp68ICXrycLaeSSDF7KRt1/bV
 Okc34yomJyhgeGkBBlJeuDvyTN/7AL0jNjTXAF/kbmnMsajgZhub3st9+bqUbbidRYB1
 9/59GM7TRB+exGVXYsIDfSpHa/ghDatNp1jLQrnVH4sfq7eYip7dzCbAMGWuGuYJe04S
 U0LcKxVyAuv/LqVlHI27VXFqvwMTYkgorWNnxQproMtvMFOQeXRzvcuoJ0YrCVw4kEv8 pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdruw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 14:57:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29C83100038;
 Tue, 14 Apr 2020 14:57:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F76A2B0FAF;
 Tue, 14 Apr 2020 14:57:29 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 14:57:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 14:57:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 01/18] usb: gadget: g_dnl: add function
 g_dnl_set_product
Thread-Index: AQHWElxAhnXwWxx4AEularOIoXi7fg==
Date: Tue, 14 Apr 2020 12:57:28 +0000
Message-ID: <1509db97-69a9-bc2e-f9e0-cc270178a6db@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-2-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <FC9612D38D005F4C8CC3F001BB1109B2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 01/18] usb: gadget: g_dnl: add function
 g_dnl_set_product
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
> Add a function g_dnl_set_product to change the Product string used in USB
> enumeration in any command based on download gadget.
>
> If the function is called with NULL pointer, the product string is set to
> the default value (product[] = "USB download gadget").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/usb/gadget/g_dnl.c | 8 ++++++++
>  include/g_dnl.h            | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/usb/gadget/g_dnl.c b/drivers/usb/gadget/g_dnl.c
> index e9e1600a1a..7a51b53f24 100644
> --- a/drivers/usb/gadget/g_dnl.c
> +++ b/drivers/usb/gadget/g_dnl.c
> @@ -89,6 +89,14 @@ static struct usb_gadget_strings *g_dnl_composite_strings[] = {
>  	NULL,
>  };
>  
> +void g_dnl_set_product(const char *s)
> +{
> +	if (s)
> +		g_dnl_string_defs[1].s = s;
> +	else
> +		g_dnl_string_defs[1].s = product;
> +}
> +
>  static int g_dnl_unbind(struct usb_composite_dev *cdev)
>  {
>  	struct usb_gadget *gadget = cdev->gadget;
> diff --git a/include/g_dnl.h b/include/g_dnl.h
> index 6d461c73d3..836ee602c8 100644
> --- a/include/g_dnl.h
> +++ b/include/g_dnl.h
> @@ -38,6 +38,7 @@ int g_dnl_board_usb_cable_connected(void);
>  int g_dnl_register(const char *s);
>  void g_dnl_unregister(void);
>  void g_dnl_set_serialnumber(char *);
> +void g_dnl_set_product(const char *s);
>  
>  bool g_dnl_detach(void);
>  void g_dnl_trigger_detach(void);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
