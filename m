Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF1280FEF
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:33:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C904FC424B1;
	Fri,  2 Oct 2020 09:33:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93961C424B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:33:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929LenT020491; Fri, 2 Oct 2020 11:33:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FDJZSMt/pjCMiv3tm2oNrhc3XiPzKfXo9guqgA4t+Q0=;
 b=mWl6SGqQoIqJPfrxGKlQn+OFLppREO5y1KflddDbFKAhiIyaDip0kFBpz3AYBPS1vWsF
 RCvNt+C8thjJFpvIOMCfXU/i0w0kUkbEH111uawxwck87ZI+by7OOrisvNIzp1HV2sgD
 L6ScxlOB1kwY6Sgvx7ps7QHVj3VxVO+MsR9Mh1FRz1hffvqA0Zuew0m2pDwQP+AIV9H8
 2LVEz3/O9SSY9o8/1wEavtJ7+N1f7SJqdMyk3wJ3US06+AjWERppt9JCF18B/3ttXSJs
 +Jb1GrCRc/NkDDp4IwI4n5FPhF+O8YtzqyPhb7V7VWZehj22wOcAtynF3mHfvCagk+mQ uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33su409gh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:33:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2954C10002A;
 Fri,  2 Oct 2020 11:33:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E5992B0895;
 Fri,  2 Oct 2020 11:33:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:33:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:33:42 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
 "cap-mmc-highspeed"
Thread-Index: AQHWi5msOY6ebWOaI0eN/3fAR/OOD6mEBX+A
Date: Fri, 2 Oct 2020 09:33:42 +0000
Message-ID: <2317beb6-2942-d2dd-6a73-336a01e35046@st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-1-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <0457545F1D6055409B4D97C2CB45F6C6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz
 support with "cap-mmc-highspeed"
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

Hi Alexndru

On 9/15/20 9:51 PM, Alexandru Gagniuc wrote:
> "cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no
> additional flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
> is used for MMC HS at both 26MHz and 52MHz.
>
> Use the same approach and enable MMC_CAP(MMC_HS_52) host capability
> when "cap-mmc-highspeed" is found in the devicetree. In the event an
> MMC card doesn't support 52 MHz, it will be clocked at a speed based
> on its EXT CSD, even on 52 MHz host controllers
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/mmc/mmc-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c
> index 90690c8d1e..6d2310eff3 100644
> --- a/drivers/mmc/mmc-uclass.c
> +++ b/drivers/mmc/mmc-uclass.c
> @@ -198,7 +198,7 @@ int mmc_of_parse(struct udevice *dev, struct mmc_config *cfg)
>  	if (dev_read_bool(dev, "cap-sd-highspeed"))
>  		cfg->host_caps |= MMC_CAP(SD_HS);
>  	if (dev_read_bool(dev, "cap-mmc-highspeed"))
> -		cfg->host_caps |= MMC_CAP(MMC_HS);
> +		cfg->host_caps |= MMC_CAP(MMC_HS) | MMC_CAP(MMC_HS_52);
>  	if (dev_read_bool(dev, "sd-uhs-sdr12"))
>  		cfg->host_caps |= MMC_CAP(UHS_SDR12);
>  	if (dev_read_bool(dev, "sd-uhs-sdr25"))

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
