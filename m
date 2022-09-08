Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B23535B1736
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 10:36:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 745DAC63327;
	Thu,  8 Sep 2022 08:36:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D546BC03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:36:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b17so11433355wrq.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 01:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=dBQtDfsr5Kf+aGeKTr9AgkRbCALEdT2PwIcV/csDFlQ=;
 b=LIG+CG18e0LoBa6tCt4zNVcILLUth8DMNyPhUa1NtF2JvbO+CYO/hW4kLDP3CL+N29
 ia2GozGTThx7et3VacICNME3MsTkWIdCb1cMb/PcJjNM6jCADLRLxP9VW/Lqkkv4QNOo
 ZuT+Y2YLuypO0P/NYj3EuDiNqb1729e8vOY9lJT6Fms2c1ZTdIzBf1N3+7j4lrIoK4nK
 litqSE+oC4jn6ezefyV2a8mFYavzO1YpY7ciZX2ThRvh+C9ZOmeBBxfYqvft4OYPQrV2
 hctI7rlISjcf+l3Uo0mIazMkf1bXOEM+nAVvGsLEyvmDvNGG4r4LItF0xJSUvySYsvRQ
 85ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dBQtDfsr5Kf+aGeKTr9AgkRbCALEdT2PwIcV/csDFlQ=;
 b=YxP0wAt0vIso9fa21WwwBiLldZ5JtKOHotHhb/RBIubxzfHZJvgZoRjdv8d5nWGrW3
 A5HKSsN83rk/nn4f/oilm8IBvGU2cLUjzSgT6qcgYKz2kcXGV7RCeCJ/61bTPaF7W/5j
 7UBLFUV/Bc2B1l1HhCBXfaX6CJWEaY173o2pOm6zKLxO4vvvYMsX/kPSzn3PVPZGmLWo
 Qhecmqo1D6fMraoR/uLiQG7XolGrc1rEiwyYQ+3Um5/QLOdQi37cuADPqcprYG5+KqH2
 l6LIWD5gAUw9NFyNLRad6cBFhqlvlXUUSoQaKmaL/v07heeZE/XdCPxLQh+ZP9yBTsnF
 u08w==
X-Gm-Message-State: ACgBeo3+qcFjvFHWLY5qwnlPWkiLdRmqEj9AVj27Ut/WhMJDpX55W0ya
 28uAPt0tx7hgrBqwhdyWDrTa4w==
X-Google-Smtp-Source: AA6agR4+SHMUafSffcoHtLXpyNK+nN6Er1LT52FwLhy9UQ/pHPinEEWCVmTlfn8bvHa2TUewCmg73w==
X-Received: by 2002:a05:6000:168c:b0:226:f4c2:d6db with SMTP id
 y12-20020a056000168c00b00226f4c2d6dbmr4254218wrd.659.1662626184336; 
 Thu, 08 Sep 2022 01:36:24 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c205800b003a83ca67f73sm1962464wmg.3.2022.09.08.01.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:36:23 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Thu, 8 Sep 2022 10:36:22 +0200
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20220908083622.GA117999@trex>
References: <20220908080627.1762034-1-alain.volmat@foss.st.com>
 <20220908080627.1762034-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908080627.1762034-4-alain.volmat@foss.st.com>
Cc: oleksandr.suvorov@foundries.io, u-boot@lists.denx.de,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH 3/3] i2c: stm32: only send a STOP upon
	transfer completion
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

On 08/09/22, Alain Volmat wrote:
> Current function stm32_i2c_message_xfer is sending a STOP
> whatever the result of the transaction is.  This can cause issues
> such as making the bus busy since the controller itself is already
> sending automatically a STOP when a NACK is generated.  This can
> be especially seen when the processing get slower (ex: enabling lots
> of debug messages), ending up send 2 STOP (one automatically by the
> controller and a 2nd one at the end of the stm32_i2c_message_xfer
> function).

um I debugged this - took me a couple of days - and I proposed a fix that has just
been massaged a little in this PR.

IMO the best thing to do is either adding me - or to be fair yourself since you
invested almost zero time on it - as a co-author. The hard bit was to find the
issue in the first place.

what do you think?

I'll try to find some time to test this.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 0ec67b5c12..8803979d3e 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>  			if (ret)
>  				break;
>  
> +			/* End of transfer, send stop condition */
> +			mask = STM32_I2C_CR2_STOP;
> +			setbits_le32(&regs->cr2, mask);
> +
>  			if (!stop)
>  				/* Message sent, new message has to be sent */
>  				return 0;
>  		}
>  	}
>  
> -	/* End of transfer, send stop condition */
> -	mask = STM32_I2C_CR2_STOP;
> -	setbits_le32(&regs->cr2, mask);
> -
>  	return stm32_i2c_check_end_of_message(i2c_priv);
>  }
>  
> -- 
> 2.25.1
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
