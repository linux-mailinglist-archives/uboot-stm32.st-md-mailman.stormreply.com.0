Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CADC60BF2B
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Oct 2022 02:02:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18245C03FC6;
	Tue, 25 Oct 2022 00:02:09 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E93DCC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 00:02:05 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20221025000202epoutp03b9ef48d1bd2397568c861bf962cf4c87~hJumrxAua2178621786epoutp03M
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 00:02:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20221025000202epoutp03b9ef48d1bd2397568c861bf962cf4c87~hJumrxAua2178621786epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666656122;
 bh=8FT7J4iUsjg8YOBZgpsn+DYX3wMG0jomdW6nbW/5jxU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lfWrhH3h4/VLpB2XoEt6xT8Yp+EMPBTOxBMIsC2yUUiVIfiincczaTK4jbQWrskHA
 BlrC56IlWV5GbnJX+r1DviEiioMqPSbR5HnW95IuvTzEqiRPPV+ED3zaRWGZ4sj8YG
 w+enRNWcgAwdYL4DwEvKTiuvCHKP60VKzvvFQR/c=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20221025000201epcas1p32c856cea33a7a6a7d1a9e7c49e806ca9~hJumOMvAK0218302183epcas1p3W;
 Tue, 25 Oct 2022 00:02:01 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.231]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4MxBvD4pf0z4x9QH; Tue, 25 Oct
 2022 00:02:00 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 E2.2C.48750.87727536; Tue, 25 Oct 2022 09:02:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221025000200epcas1p1b194bdef2ee24c76f15d8ff58ba98a10~hJuk-9mPq0457704577epcas1p16;
 Tue, 25 Oct 2022 00:02:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221025000200epsmtrp2a72f9d943744e57127f81a01d72bdb21~hJuk-MFK41825418254epsmtrp2P;
 Tue, 25 Oct 2022 00:02:00 +0000 (GMT)
X-AuditID: b6c32a39-295ff7000000be6e-5c-635727789e73
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.79.18644.87727536; Tue, 25 Oct 2022 09:02:00 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221025000200epsmtip104857d7750922c498007eb19dbde74f4~hJuktNXQ90169101691epsmtip1d;
 Tue, 25 Oct 2022 00:02:00 +0000 (GMT)
Message-ID: <b7d328f1-9737-f93f-a679-582936be266d@samsung.com>
Date: Tue, 25 Oct 2022 09:01:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
In-Reply-To: <20220913112346.301480-1-yann.gautier@foss.st.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmrm6FeniywZXrqhaHz79jt/h58j27
 xaT119gtfqz6wmrxdm8nu8XCrctZLF78/cPowO7xtH8ru8fZOzsYPTa+28HkcXCfYQBLVLZN
 RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAFSgpliTml
 QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC0wK94sTc4tK8dL281BIrQwMDI1OgwoTsjPdX
 6wo6uSuunlVrYHzE0cXIySEhYCJx7stxpi5GLg4hgR2MEv0fpzNDOJ8YJSbeamSEcD4zSlxb
 vI4JpmXJ/k5WiMQuRokvs35C9b9nlLi0/wsLSBWvgJ3E50MvwTpYBFQlpt18xQQRF5Q4OfMJ
 WI2oQJTEpU1vWEFsYQE3ie6t98FsZgFxiVtP5oPViwg4SryefQTsJmaQMyY92wfWzCagI7H9
 23GwIk4Be4lPn86wQDTLS2x/OwesQUKgk0Pi+cf/LBB3u0jsWzcR6gdhiVfHt7BD2FISn9/t
 ZYNoaGaUWLrkICuE08Mo8a/hOhtElbHE/qWTgbo5gFZoSqzfpQ8RVpTY+XsuI8RmPol3X3tY
 QUokBHglOtqEIEpUJC69fskEs+vuk/9QJR4S95r9JzAqzkIKl1lI/p+F5J1ZCHsXMLKsYhRL
 LSjOTU8tNiwwhcd2cn7uJkZw6tSy3ME4/e0HvUOMTByMhxglOJiVRHhZngQnC/GmJFZWpRbl
 xxeV5qQWH2I0BcbORGYp0eR8YPLOK4k3NLE0MDEzMjaxMDQzVBLnbZihlSwkkJ5YkpqdmlqQ
 WgTTx8TBKdXAxHBbb3ltk7vMqt/s1UxXZ4drHD+ufvOM2neZjxrCXx9/SGySTru2vpJ7NcP+
 pfemiyy7Yvw+9M22TZsePHcKOOBfcr45+N6/5On2sSYZh3f6xxd2tKrP4L7vf/5JhpuCRZeF
 QsBGrmifVRm9PGH9fwSiFX/t8zhY/6cg+MjVOfpVL120/0yZVly2/nHsctVQl5bPcqFfMlom
 7wuewvVa2lppl8GsOdOyet9cYZVamq8ccYzL10CizHb7pPzPaTvvJc9iXH73pkOTwYfDPmee
 Gvi+j5pZliKyInGD/I1ldxUjGU4st3M42KEY3FrAGpATvDHyU+j5huynF9PaA598UlCvqix4
 zqnp63yd1fCHEktxRqKhFnNRcSIAVltCCyYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSnG6FeniywZS5QhaHz79jt/h58j27
 xaT119gtfqz6wmrxdm8nu8XCrctZLF78/cPowO7xtH8ru8fZOzsYPTa+28HkcXCfYQBLFJdN
 SmpOZllqkb5dAlfG+6t1BZ3cFVfPqjUwPuLoYuTkkBAwkViyv5O1i5GLQ0hgB6PEo2mPmCAS
 UhKfn05l62LkALKFJQ4fLoaoecsoMWvNcXaQGl4BO4nPh16C1bMIqEpMu/mKCSIuKHFy5hMW
 EFtUIEpi6eMeMFtYwE2ie+t9VhCbWUBc4taT+WD1IgKOEq9nH2EGWcAs8JlRovfKGrCEENCC
 uZv+gzWwCehIbP92HCzOKWAv8enTGRaQ45gF1CXWzxOCmCkvsf3tHOYJjEKzkJwxC8m6WQgd
 s5B0LGBkWcUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERwlWlo7GPes+qB3iJGJg/EQ
 owQHs5IIL8uT4GQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4
 OKUamPa6Hu6Oql/L7a9i//Of4dI+/jM7GbeU7ghlfGDE8NAvZapxSuCjqfbXjEtS98y7KJXt
 nJAX+WbW0Vn7Ju+xjpV9enJ5xzMz3YUz4pPD/FjMA19aJG4JXt05vfVvwq0lf867nmu4NSNg
 rxj75kw3Iz+O2t559WrxWWsCTvv/WXTa5l2hWs5fSePrMyp1N4nmPjG0OWL30T3/iqMYy2Z3
 zRdr93qxMywRrI2zOTTvQIfbu5U9aQfCfqqYftqwa3VzYXasXl7Tih7tB7N5LjImnP4mveUd
 3/W7i5y03wcm3OvfuPr/LNukdy01z/bXXdnfveuvQdyqZL7Ggv8zwv/YH/lzwczg47mzt6/f
 ymF+I6PEUpyRaKjFXFScCAC/w87vAQMAAA==
X-CMS-MailID: 20221025000200epcas1p1b194bdef2ee24c76f15d8ff58ba98a10
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221025000200epcas1p1b194bdef2ee24c76f15d8ff58ba98a10
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
 <CGME20221025000200epcas1p1b194bdef2ee24c76f15d8ff58ba98a10@epcas1p1.samsung.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] mmc: stm32_sdmmc2: add dual data rate
	support
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

On 9/13/22 20:23, Yann Gautier wrote:
> To support dual data rate with STM32 sdmmc2 driver, the dedicated bit
> (DDR - BIT(18)) needs to be set in the CLKRC register. Clock bypass
> (no divider) is not allowed in this case. This is required for the
> eMMC DDR modes.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Applied to u-boot-mmc. Thanks! (with [PATCH 2/3] and [PATCH 3/3])

Best Regards,
Jaehoon Chung


> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index bfce8a2e4a..3cfa5a66f1 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -598,13 +598,16 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  	 * clk_div > 0 and NEGEDGE = 1 => command and data generated on
>  	 * SDMMCCLK falling edge
>  	 */
> -	if (desired && ((sys_clock > desired) ||
> +	if (desired && (sys_clock > desired || mmc->ddr_mode ||
>  			IS_RISING_EDGE(plat->clk_reg_msk))) {
>  		clk = DIV_ROUND_UP(sys_clock, 2 * desired);
>  		if (clk > SDMMC_CLKCR_CLKDIV_MAX)
>  			clk = SDMMC_CLKCR_CLKDIV_MAX;
>  	}
>  
> +	if (mmc->ddr_mode)
> +		clk |= SDMMC_CLKCR_DDR;
> +
>  	if (mmc->bus_width == 4)
>  		clk |= SDMMC_CLKCR_WIDBUS_4;
>  	if (mmc->bus_width == 8)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
