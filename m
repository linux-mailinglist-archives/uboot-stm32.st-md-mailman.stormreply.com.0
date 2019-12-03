Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13010FA5C
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2019 10:02:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97ED0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2019 09:02:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D72C3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 09:02:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB392U4b021591; Tue, 3 Dec 2019 10:02:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ddhk5YMycS7L9oN1tgXa8AOJoTQw14ub4m4ggkSX0JM=;
 b=dwlN+97zxGAyN14DR84FcgdRLZSwAH2F8Jm0DNeo9pfYT7VgLfgk0Q8HwU6CSDwuFHs7
 LIoWFEmBxtU6S8Pds4nGbM4G+Xi0sr4okTLpMco7KCRmVH7OWvzAbyC/RX2MPO4s3PnE
 Lrl67sPzMmoonIdZLYEOLiyPtPSMO2l8ThntckEZr2hMjPgHPuSnbi5z2lwMhLebr+aY
 /2lZubMUg7Qxg6fNKn6kILfNclwCNz95w6BbgT5eZ+CvqdVUpdOTrTtFX2KS1Xur8ofh
 BDvHd//U6trjY9ypnxvBd/r8VbGjSubqwS2WQ6CR8hIDKlzzUWJ3WrsdTZao4ctV7ciB IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkes2p8jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 10:02:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9845410002A;
 Tue,  3 Dec 2019 10:02:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89AA82A9F55;
 Tue,  3 Dec 2019 10:02:29 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Dec
 2019 10:02:29 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 3 Dec 2019 10:02:29 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] cmd: pxe: execute the cls command only when supported
Thread-Index: AQHVqbUQ516v4Yin7kaBIuAgFP6jUKeoDJgA
Date: Tue, 3 Dec 2019 09:02:29 +0000
Message-ID: <548341a1-9cea-40d4-a6e2-e84eb56d0366@st.com>
References: <20191203083835.6898-1-patrick.delaunay@st.com>
In-Reply-To: <20191203083835.6898-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D22E53EAB1E3D146976E0F4CFB5FEA59@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_01:2019-11-29,2019-12-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 =?utf-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Subject: Re: [Uboot-stm32] [PATCH] cmd: pxe: execute the cls command only
	when supported
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

Hi Patrick

On 12/3/19 9:38 AM, Patrick Delaunay wrote:
> Execute the command cls (for clear screen), when the "menu background"
> keyword is present in extlinux.conf file, only if the command is supported.
>
> This patch avoid the warning "Unknown command 'cls'"
> with "menu background" in extlinux.conf when CONFIG_CMD_BMP is activated
> and CONFIG_CMD_CLS not activated (default for CONFIG_DM_VIDEO).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/pxe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/cmd/pxe.c b/cmd/pxe.c
> index 2059975446..b62cb79b3a 100644
> --- a/cmd/pxe.c
> +++ b/cmd/pxe.c
> @@ -1592,7 +1592,8 @@ static void handle_pxe_menu(cmd_tbl_t *cmdtp, struct pxe_menu *cfg)
>  	/* display BMP if available */
>  	if (cfg->bmp) {
>  		if (get_relfile(cmdtp, cfg->bmp, load_addr)) {
> -			run_command("cls", 0);
> +			if (CONFIG_IS_ENABLED(CMD_CLS))
> +				run_command("cls", 0);
>  			bmp_display(load_addr,
>  				    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
>  		} else {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
