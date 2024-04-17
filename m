Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BB8A81BD
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 13:11:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEE75C6B444;
	Wed, 17 Apr 2024 11:11:34 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FDDBC69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 11:11:33 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240417111130epoutp045ee2ab5cc7bda399cfe0c96d2b71544d~HDNSsseBq0523605236epoutp04J
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 11:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240417111130epoutp045ee2ab5cc7bda399cfe0c96d2b71544d~HDNSsseBq0523605236epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1713352290;
 bh=1V0LaxwIybdeqLa2GN84XZLrBNn4M7/6M44FR4ok68Y=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=TlVQcDFRgAT/jZKuaUAzjU4I/bcKa5UVVC4mKzNYjwf2rwqos31YE6RqwHXvcTvKv
 sjzrmVejiUTXD3hZWKByik95H8CAcYs6SSyLtvhcwHnHQptZgsf8G6tWeBqrqe6/SM
 HISsbCaoQffxj1Mg53nk2dMxZC+MkdQJLi1t1h/E=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240417111130epcas1p35da87f3b72a9c62ac339845545d68155~HDNSN3tsh0215002150epcas1p3i;
 Wed, 17 Apr 2024 11:11:30 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.235]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4VKJBT2Xvhz4x9Pr; Wed, 17 Apr
 2024 11:11:29 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.15.10076.16EAF166; Wed, 17 Apr 2024 20:11:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240417111128epcas1p23e29b63a9609ffba0928d4a1c25904b7~HDNQdinAv0634406344epcas1p2Q;
 Wed, 17 Apr 2024 11:11:28 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240417111128epsmtrp2da641607209f4a466feeaf5bff146b8e~HDNQc1x3N0389803898epsmtrp2V;
 Wed, 17 Apr 2024 11:11:28 +0000 (GMT)
X-AuditID: b6c32a39-7edf87000000275c-0a-661fae618528
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EA.E8.08390.06EAF166; Wed, 17 Apr 2024 20:11:28 +0900 (KST)
Received: from jh80chung01 (unknown [10.113.111.84]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240417111128epsmtip15feebd984fcd1a2376a3021de222e656~HDNQLLhh90640806408epsmtip1z;
 Wed, 17 Apr 2024 11:11:28 +0000 (GMT)
From: "Jaehoon Chung" <jh80.chung@samsung.com>
To: "'Patrick DELAUNAY'" <patrick.delaunay@foss.st.com>, "'Patrice Chotard'"
 <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
In-Reply-To: <8602799a-7c52-4308-a58e-4986de57210b@foss.st.com>
Date: Wed, 17 Apr 2024 20:11:27 +0900
Message-ID: <01e101da90b7$fe546690$fafd33b0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHEDEWbNqTCtiddf3YFOsrAgyEnTQHFznTAAaEDOzkCU0VHE7Frhq5g
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmgW7iOvk0g90HuS1+nnzPbjFp/TV2
 ix+rvrBabL03gcni25ZtjBZTJ21mt3i7t5PdYuHW5SwOHB6zGy6yeDzt38rusXPWXXaPVwdW
 sXucvbOD0WPjux1MHgf3GQawR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp
 5CXmptoqufgE6Lpl5gBdpaRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMC3QK07M
 LS7NS9fLSy2xMjQwMDIFKkzIzjh+ch1zwUf+ilf/N7A2ML7k6WLk4JAQMJE4dUO4i5GLQ0hg
 B6PEt5t9LBDOJ0aJH4fbmCGcb4wSay+AOJxgHQfm7mSFSOxllFjY/54RwnnJKDFn+jM2kCo2
 AT2J/4sWgrWLCLQwSrS83wLmMAtcYpSYefYkC0gVp4C9xP43Z1lBbGEBH4m7D26CdbMIqEqc
 P3sQbB+vgKXE26X/WSBsQYmTM5+A2cwC8hLb386BuklB4ufTZWBzRATcJH483MMIUSMiMbsT
 4gkJgS0cEn23N7FANLhIbPj5mhHCFpZ4dXwLO4QtJfH53V42iIZmRomlSw6yQjg9jBL/Gq6z
 QVQZS+xfOpkJFIDMApoS63fpQ2zjk3j3tYcVEq68Eh1tQhDVKhKXXr9kgpl/98l/VgjbQ+L9
 3SPsExgVZyH5bRaS32Yh+WEWwrIFjCyrGMVSC4pz01OLDQtM4RGenJ+7iRGcaLUsdzBOf/tB
 7xAjEwfjIUYJDmYlEd4WYdk0Id6UxMqq1KL8+KLSnNTiQ4ymwNCeyCwlmpwPTPV5JfGGJpYG
 JmZGxiYWhmaGSuK8Z66UpQoJpCeWpGanphakFsH0MXFwSjUwVa6Vu1nreezHubc3rZ7+1OFS
 ucZ6/LDSmdq+RS9yssLyjgoEexvxds7cm9NxbUqg5cLj6YyK1qYtu0zM3E9rxT8P15utJpwh
 vIXfYNM9yQ2qLQl2HYf6ViduSTQpzFr3d/3uzNyVPwv6HnTtFfx//lOzam2ozsNri9ymJ6Xp
 h34VmnK8cN8sa+64nmAJGcOD7ldPSmgF6DvEP1PyFLTI2tloafT9SuzxgxaLDllm2+9LDTJW
 rLijmxTjxXbAun9BQLiQnJLFje1/rQTkPm17VV+62nvFZreiGwyzG4yLVt//+pDpTLRf4VGW
 8x8VDlnUymhEro1nnC9oqlRlIiasGm6xQN1lTXzXm5r+BiWW4oxEQy3mouJEACfdgNA9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnG7COvk0g8WH+Cx+nnzPbjFp/TV2
 ix+rvrBabL03gcni25ZtjBZTJ21mt3i7t5PdYuHW5SwOHB6zGy6yeDzt38rusXPWXXaPVwdW
 sXucvbOD0WPjux1MHgf3GQawR3HZpKTmZJalFunbJXBlHD+5jrngI3/Fq/8bWBsYX/J0MXJy
 SAiYSByYu5O1i5GLQ0hgN6PE8u9zGCESUhKfn05l62LkALKFJQ4fLoaoec4oMae7jwmkhk1A
 T+L/ooXMIAkRgTZGiRPLFjCBOMwC1xglzi/+wwbR8g8os3wv2FhOAXuJ/W/OsoLYwgI+Encf
 3GQDsVkEVCXOnz3IDGLzClhKvF36nwXCFpQ4OfMJmM0soC3x9OZTKFteYvvbOcwQpypI/Hy6
 DGymiICbxI+HexghakQkZne2MU9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5xYYFRnmp
 5XrFibnFpXnpesn5uZsYwRGnpbWDcc+qD3qHGJk4GA8xSnAwK4nwtgjLpgnxpiRWVqUW5ccX
 leakFh9ilOZgURLn/fa6N0VIID2xJDU7NbUgtQgmy8TBKdXAxL9xLo/U5EUvlPUOXipf31zK
 uiQlWpaVTWPGApeq2MvCAvLvH3w1fTOB6bhenMb2r5ET836dWXPBoI/p+9LHC+8pqTsz3Lte
 4xvmFuy2LDK8/d/LVc7VWeoGvJ6qZ5/W1Oy8+TJmd4rZw+X+DKkfltnUL5lZNafD+Zhm59Wy
 cI33bIHBMsJdex26JRsVUtbfP8B7TNMuLDlIe2pqrGfph89zOBLU8vefz9psFnLMzVvM/JtN
 0/VbwvvOVN7rFEtbtLT1rXboro82e8/HbX2gobc/qegPh1lS1/avMd8c1Lnm5s1o1udiF5+Z
 9CHxIgv7c/nvHOdPeOqftxV0aeYyvnTif37PcU+hv7Z9khuUWIozEg21mIuKEwHmpFQhJwMA
 AA==
X-CMS-MailID: 20240417111128epcas1p23e29b63a9609ffba0928d4a1c25904b7
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240417090254epcas1p2141358dc9427f77a9bb8102d88bbff6c
References: <20240308142614.2700185-1-patrice.chotard@foss.st.com>
 <20240308142614.2700185-2-patrice.chotard@foss.st.com>
 <CGME20240417090254epcas1p2141358dc9427f77a9bb8102d88bbff6c@epcas1p2.samsung.com>
 <8602799a-7c52-4308-a58e-4986de57210b@foss.st.com>
Cc: 'U-Boot STM32' <uboot-stm32@st-md-mailman.stormreply.com>,
 'Tom Rini' <trini@konsulko.com>, 'Peng Fan' <peng.fan@nxp.com>, 'Simon
 Glass' <sjg@chromium.org>, 'Sean Anderson' <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] mmc: stm32_sdmmc2: Fix AARCH64
	compilation warnings
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



> -----Original Message-----
> From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
> Sent: Wednesday, April 17, 2024 6:02 PM
> To: Patrice Chotard <patrice.chotard@foss.st.com>; u-boot@lists.denx.de
> Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Jaehoon Chung <jh80.chung@samsung.com>;
> Peng Fan <peng.fan@nxp.com>; Sean Anderson <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>; Tom
> Rini <trini@konsulko.com>
> Subject: Re: [PATCH 2/2] mmc: stm32_sdmmc2: Fix AARCH64 compilation warnings
> 
> Hi,
> 
> On 3/8/24 15:26, Patrice Chotard wrote:
> > When building with AARCH64 defconfig, we got warnings, fix them.
> >
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> >
> >   drivers/mmc/stm32_sdmmc2.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> > index d4982a14281..39ae79ba129 100644
> > --- a/drivers/mmc/stm32_sdmmc2.c
> > +++ b/drivers/mmc/stm32_sdmmc2.c
> > @@ -220,9 +220,9 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
> >
> >   	if (data->flags & MMC_DATA_READ) {
> >   		data_ctrl |= SDMMC_DCTRL_DTDIR;
> > -		idmabase0 = (u32)data->dest;
> > +		idmabase0 = (u32)(long)data->dest;
> >   	} else {
> > -		idmabase0 = (u32)data->src;
> > +		idmabase0 = (u32)(long)data->src;
> >   	}
> >
> >   	/* Set the SDMMC DataLength value */
> > @@ -463,8 +463,8 @@ retry_cmd:
> >
> >   	stm32_sdmmc2_start_cmd(dev, cmd, cmdat, &ctx);
> >
> > -	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%x\n",
> > -		cmd->cmdidx, data ? ctx.data_length : 0, (unsigned int)data);
> > +	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%p\n",
> > +		cmd->cmdidx, data ? ctx.data_length : 0, data);
> >
> >   	ret = stm32_sdmmc2_end_cmd(dev, cmd, &ctx);
> >
> 
> 
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> 
> Thanks
> Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
