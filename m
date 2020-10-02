Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93178281006
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:43:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD30C424B0;
	Fri,  2 Oct 2020 09:43:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B22C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:43:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929h4Wf019560
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 2 Oct 2020 11:43:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YmDbLy+VeTSgulB0JOhQ+o/VrjbtJ9oh3HL0t0TmEaM=;
 b=ZPIySBtVU+gD6QWCuQZcseZF+rGWDIpjhF0FcEj1qaDhCTIbDwEW9Kl4c4f/sTyOot2E
 7LB8RNR2krwycnDC1au8MptLsyTdXWNxWnYFsxd/iC+UVgpRqKo4FTx+bKq0B7cu8Bx4
 S7A4R7BO4JAvmNdPhj8C39f6wMzsl1Vk88A8OQdaeWt1WzFw+Fx0OD885c9IL9m5ncKl
 qAu/9JKwMTcrFDAwysY9zfD8sKUL/cAIh+94YCJodqkGn07/Y/2mHroT0QJ0/JzGA0hM
 OCCYrG5Rfhbc1mAZ3JNYTPqWyIx31CUAQfFSv5i5Zdbg1adCIfTIo6ez5yrWRvfbWYnV AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf2fak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 02 Oct 2020 11:43:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80D35100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:43:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78E442B1517
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:43:42 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:43:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:43:42 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
 which support live DT
Thread-Index: AQHWmKCDchj+UIXDDUO/zHlw6kJWgw==
Date: Fri, 2 Oct 2020 09:43:42 +0000
Message-ID: <3c8ab0b5-5291-e396-0022-7dfbdec86ba9@st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
 <20200909154413.28064-2-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <F206F45F2ACB4C4893F9266F575DC257@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
 which support live DT
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

HI Patrick

On 9/9/20 5:44 PM, Patrick Delaunay wrote:
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/video/stm32/stm32_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
> index 283151398b..9d5abacc2b 100644
> --- a/drivers/video/stm32/stm32_dsi.c
> +++ b/drivers/video/stm32/stm32_dsi.c
> @@ -359,8 +359,7 @@ static int stm32_dsi_attach(struct udevice *dev)
>  
>  	ret = panel_get_display_timing(priv->panel, &timings);
>  	if (ret) {
> -		ret = fdtdec_decode_display_timing(gd->fdt_blob,
> -						   dev_of_offset(priv->panel),
> +		ret = ofnode_decode_display_timing(dev_ofnode(priv->panel),
>  						   0, &timings);
>  		if (ret) {
>  			dev_err(dev, "decode display timing error %d\n", ret);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
