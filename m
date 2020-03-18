Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44861898DA
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:04:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC5AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:04:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6A5EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:04:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9mfY9025480; Wed, 18 Mar 2020 11:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=55b/Of9VJcc2W1y8FSUAx8j53HgDAtwb4I+60Mz+5dE=;
 b=VotaFi08CPr69C68VEoAJ0J+unjlHsKbGkuJGNwpEf5S1tLNrtL2++7ca+U8IMFLx3rT
 ijJZF/TmZC3L81s0+z/8iY6aMVSgO0d0v5aWAsszmFpL9Z1aoPUzyY4wJh1EWbEYqz1J
 L6SxkOorEUi78sKUwJ2dfUJ7fEWZL58I6LfJjJwqwaUG0qTnoxT1qTt9xOPaPWCGFucW
 YKWmm+gzwlo6VWHTWVO5KhDn6NdpukrRoBGl+f5DYxzp6AD6PdwjUI70lk3Xi/vqvewC
 xc2iV2fTtKsx+wtLMRAlHCzGCi8YoiKxDr4U2ivm6yDvO7sL4fuxELSFHsqlNDFUaCLC gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdb7ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:04:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7ACA410002A;
 Wed, 18 Mar 2020 11:04:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B940220FF0;
 Wed, 18 Mar 2020 11:04:20 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:04:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:04:19 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 01/10] board: stm32mp1: update command
 stboard on misc_write result
Thread-Index: AQHV/QyXSiBRTSlaYkqk6GQGJJlP3Q==
Date: Wed, 18 Mar 2020 10:04:19 +0000
Message-ID: <6ec880ae-6692-28fb-88c5-2bec3c9e6582@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-2-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <6C2599A59E79B6458901AAAE9076B0C8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] board: stm32mp1: update command
 stboard on misc_write result
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


On 2/12/20 7:37 PM, Patrick Delaunay wrote:
> Update management of misc_write, which now return length of data
> after the commit 8729b1ae2cbd ("misc: Update read() and write()
> methods to return bytes xfered")
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/cmd_stboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index e994a88e71..b740f4510e 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -125,7 +125,7 @@ static int do_stboard(cmd_tbl_t *cmdtp, int flag, int argc,
>  	ret = misc_write(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>  			 &otp, sizeof(otp));
>  
> -	if (ret) {
> +	if (ret < 0) {
>  		puts("BOARD programming error\n");
>  		return CMD_RET_FAILURE;
>  	}

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
