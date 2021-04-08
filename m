Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F77358FA1
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 00:09:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E80CFAC55;
	Thu,  8 Apr 2021 22:09:44 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2637C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 22:09:42 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210408220939epoutp015b57baf05cd2f497751b73f620534f5f~0AXeTvmv-1329213292epoutp01C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 22:09:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210408220939epoutp015b57baf05cd2f497751b73f620534f5f~0AXeTvmv-1329213292epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617919779;
 bh=feaiRHr5UvsY3nmRFgAgnQrOf8IETIJMUrHT9wKTmaA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=f0FFYXgzqZLzptyTO42r7w8V3y4IcoSw7xdC+gfpJw7nrg2V9wPkoi319m2z8C0km
 6W64scx8NDTfjyRv7c+SEs72JvnmdMU6cKvygzgMmYl+MOgVe/tTq2fMiIGjeyOBD4
 pBPbP/W2Ow/GbmYLfDkEGZ7PwXOK2tJB2eh0+y5g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210408220938epcas1p3e2907c46e4a5b4c2b48d3a7b6b2930d2~0AXdy-H_B2545125451epcas1p3b;
 Thu,  8 Apr 2021 22:09:38 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4FGb5p1yVxz4x9Pp; Thu,  8 Apr
 2021 22:09:34 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.60.02277.E1F7F606; Fri,  9 Apr 2021 07:09:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210408220933epcas1p4dfd7d594528644361c843ddc7e55675c~0AXZNaDqE2243422434epcas1p4a;
 Thu,  8 Apr 2021 22:09:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210408220933epsmtrp1ac984496b697dd9b6eb41d7fee3d4807~0AXZMxK9V1991219912epsmtrp1T;
 Thu,  8 Apr 2021 22:09:33 +0000 (GMT)
X-AuditID: b6c32a36-4edff700000108e5-20-606f7f1eee68
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.7B.33967.D1F7F606; Fri,  9 Apr 2021 07:09:33 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210408220933epsmtip1265843640430c590e625564ef1f7add8~0AXY-87tj0338803388epsmtip13;
 Thu,  8 Apr 2021 22:09:33 +0000 (GMT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <fcab9ea0-d84e-1527-9b21-e93ee147b384@samsung.com>
Date: Fri, 9 Apr 2021 07:10:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406095752.1.I339c57936517e4941007cc421c1e2cad5a08a0d3@changeid>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdlhTT1euPj/BYPciLoufJ9+zW0xaf43d
 YuWl/6wWb/d2slss3LqcxYHV42n/VnaPs3d2MHoc3Gfo8fTHXuYAlqhsm4zUxJTUIoXUvOT8
 lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygvUoKZYk5pUChgMTiYiV9O5ui
 /NKSVIWM/OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7Iy+ll8sBU+4Kjp3P2Nq
 YDzN0cXIySEhYCLxtv0jcxcjF4eQwA5GiRk7L7NCOJ8YJX4tbGeCcL4xSvy+tAGojAOs5fZD
 Poj4XkaJj9fms0E47xklzh5pYgOZKyyQIvG/4Q4TiC0i4Clx89luRhCbWWAWo8SO/3IgNpuA
 jsT2b8fBangF7CSuTrsJVsMioCKxZ8smsLioQKTEzqcv2SFqBCVOznzCAmJzCgRJHG5uY4aY
 KS5x68l8JghbXmL72zlg/0gI/GWXmNfSwQrxqIvEtdffmSBsYYlXx7ewQ9hSEi/726Dsaold
 zWegmjsYJW5ta4JqMJbYv3QyE8j7zAKaEut36UOEFSV2/p4L9RifxLuvPayQEOKV6GgTgihR
 kbj0+iUTzKq7T/5DneMhMXveTZYJjIqzkLw2C8k7s5C8Mwth8QJGllWMYqkFxbnpqcWGBUbI
 sb2JEZwmtcx2ME56+0HvECMTB+MhRgkOZiUR3h292QlCvCmJlVWpRfnxRaU5qcWHGE2BgT2R
 WUo0OR+YqPNK4g1NjYyNjS1MDM1MDQ2VxHkTDR7ECwmkJ5akZqemFqQWwfQxcXBKNTAZGXN4
 bVTTsMyJ0lF7Krgjf+njk+Khib9trXdd5+1Y90N/bcHqujox7xSrO3Jv4rf85Jjw5lewouPN
 Wcu9gxhX7Asqn9d+dD7XpN1sWVX9c5e+u+rn/uWu88QcuU8Owacfx00Jj/LRc7bfzGLTvONc
 UtS3ny81DoW/n5+ifWmiwL9Dv1lqg4P1t1jMCdwvUcJ2f9tTO82skE+7u+5q3zq6q//I0pAp
 MxsjlrA87Y/slve+ZnHZIezt/5pjtuaNMUdTNZ41rJyqF5IzY5/RltrPsy4uLY49uExtZwL3
 TDbx6uPWQkmbwn1U1gY0/Til/v7hy/cndBi82eTlhfiveC/hPZx6rmNvzL8Ftz4+Z49TYinO
 SDTUYi4qTgQAtjJiTRwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnK5sfX6CwdSFahY/T75nt5i0/hq7
 xcpL/1kt3u7tZLdYuHU5iwOrx9P+reweZ+/sYPQ4uM/Q4+mPvcwBLFFcNimpOZllqUX6dglc
 GX0tv1gKnnBVdO5+xtTAeJqji5GDQ0LAROL2Q74uRi4OIYHdjBLnH8xg7GLkBIpLSXx+OpUN
 okZY4vDhYoiat4wSK5c/YAOpERZIkfiz4R5YvYiAp8TNZ7sZQYqYBWYxSpz82MMI0bGUUWJt
 Qy8rSBWbgI7E9m/HmUBsXgE7iavTboJ1swioSOzZsokJZJuoQKTEzh2WECWCEidnPmEBsTkF
 giQON7cxg9jMAuoSf+ZdgrLFJW49mc8EYctLbH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYyS
 qQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGhpbmDcfuqD3qHGJk4GA8xSnAwK4nw7ujN
 ThDiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBaS3HgeLA
 U/c044UvHtBKdvHZbRou7jXXeN6sFbw67dM2pk8o29zCEncjesqxphTmzc/67zJdT+Wdocgf
 Uijlfmtm63vt5w1HPiw58n3KkdXfzs2q9j+a3zItNmIC6/eJ93sMP299ZD7Rwe7opbyzU+uN
 +FkqD/kF3DzTd35Xi3rN9DPhM3/rX//72MXiwfc89vPr+Tb7tnG7f/zUqfJdbs32+xsaE74r
 O5msyi8VlHmbWPXgOWv8off8gvffGu7cKZV04IRAyZ9WQwWPZzam1qqXG79YLtteKbZ+k9vE
 vntlcpw8RWue3Z3Vfn33X28nUc0Tc/eof+YtOPg7f+/BaQ+El66+yK5xN1pN+OglZgMlluKM
 REMt5qLiRABw/k/o+gIAAA==
X-CMS-MailID: 20210408220933epcas1p4dfd7d594528644361c843ddc7e55675c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210406075821epcas1p3d7a41df177d536e6ee14be60f4556999
References: <CGME20210406075821epcas1p3d7a41df177d536e6ee14be60f4556999@epcas1p3.samsung.com>
 <20210406095752.1.I339c57936517e4941007cc421c1e2cad5a08a0d3@changeid>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: remove the
 board_check_usb_power function when ADC is not activated
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

On 4/6/21 4:57 PM, Patrick Delaunay wrote:
> Simplify the code of the function board_check_usb_power
> based in CONFIG_ADC and adc_measurement; the function is removed by the
> linker when the CONFIG_ADC is not activated.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 759181fb5d..261ec15e1b 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -347,6 +347,9 @@ static int board_check_usb_power(void)
>  	u32 nb_blink;
>  	u8 i;
>  
> +	if (!IS_ENABLED(CONFIG_ADC))
> +		return -ENODEV;
> +
>  	node = ofnode_path("/config");
>  	if (!ofnode_valid(node)) {
>  		log_debug("no /config node?\n");
> @@ -370,11 +373,7 @@ static int board_check_usb_power(void)
>  
>  	/* perform maximum of 2 ADC measurements to detect power supply current */
>  	for (i = 0; i < 2; i++) {
> -		if (IS_ENABLED(CONFIG_ADC))
> -			ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
> -		else
> -			ret = -ENODEV;
> -
> +		ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
>  		if (ret)
>  			return ret;
>  
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
