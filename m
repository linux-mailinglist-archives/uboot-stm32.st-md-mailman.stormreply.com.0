Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BEFEAFFB
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 13:17:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 735BDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 12:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5575C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 12:17:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9VCCVHK006530; Thu, 31 Oct 2019 13:17:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=isSoMD/pcxAoEXzDk6OrIbWtKJokEyvLHGGpVHchtjI=;
 b=PwVrb3JVNcQXurS8ApX5j9E1FYV1+/GLuIzKi4wSktU4Z9D31X/beEWD76E8QdrMpsbz
 +LK6aBj1ItbBC9Np0W+YIoB6AZUwFtY0AeNB684BT4rdTg6noStWtpLJl7PEslNXMgZL
 cPRwXHQT0J2lboBk7lixtXA0MRhisHNGey/I4V+1yRFlQs/gXxTh2AzvIHRS8LvqGJMu
 0Qb7dbH0kVjPmQrvLF4n/5/gxTERs6UH/+FybZrpCcc1Ong3lviZJaemwwbASqxzPnmy
 1VAlxjeDt0wJYk/RRVY2oJ/iHEH1Nr2F0XeAGz/Qo7hGRZGRWsQMNcNLMxxB5xWJFKJe Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwhe9j1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 13:17:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2B23100038;
 Thu, 31 Oct 2019 13:17:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FABB2B7819;
 Thu, 31 Oct 2019 13:17:09 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 31 Oct
 2019 13:17:08 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 31 Oct 2019 13:17:09 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 03/13] dm: core: add ofnode function to iterate on node
 property
Thread-Index: AQHViagPuG4qErHQHEi+oCsVw5XIAadyZBOAgAJRvHA=
Date: Thu, 31 Oct 2019 12:17:09 +0000
Message-ID: <3bdc222b619144f5b0a69e5051d6a000@SFHDAG6NODE3.st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-4-patrick.delaunay@st.com>
 <CAPnjgZ0rNAtMoaKnQ-6vRp51xJDfE=u15_yg4Xq6Rg32yCcA6A@mail.gmail.com>
In-Reply-To: <CAPnjgZ0rNAtMoaKnQ-6vRp51xJDfE=u15_yg4Xq6Rg32yCcA6A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_05:2019-10-30,2019-10-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 03/13] dm: core: add ofnode function to
 iterate on node property
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

Hi Simon,

> From: Simon Glass <sjg@chromium.org>
> Sent: mercredi 30 octobre 2019 02:48
> 
> On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Add functions to iterate on all property with livetree
> > - ofnode_get_first_property
> > - ofnode_get_next_property
> > - ofnode_get_property_by_prop
> >
> > For example:
> > for (prop = ofnode_get_first_property(dev_ofnode(dev));
> >      prop;
> >      prop = ofnode_get_next_property(dev_ofnode(dev),prop))
> > {
> >      value = ofnode_get_property_by_prop(dev_ofnode(dev), prop,
> >                                          &propname, &len); ....
> > }
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/core/of_access.c | 32 ++++++++++++++++++++++++++++
> >  drivers/core/ofnode.c    | 45 ++++++++++++++++++++++++++++++++++++++++
> >  include/dm/of_access.h   | 40 +++++++++++++++++++++++++++++++++++
> >  include/dm/ofnode.h      | 39 +++++++++++++++++++++++++++++++++-
> >  4 files changed, 155 insertions(+), 1 deletion(-)
> 
> Please can you add the dev_read() interface too?  Also need to support
> CONFIG_DM_DEV_READ_INLINE in read.h

Yes I will it,

 
> [..]
> 
> > diff --git a/include/dm/of_access.h b/include/dm/of_access.h index
> > 13fedb7cf5..0418782aa2 100644
> > --- a/include/dm/of_access.h
> > +++ b/include/dm/of_access.h
> > @@ -103,6 +103,46 @@ struct property *of_find_property(const struct
> > device_node *np,  const void *of_get_property(const struct device_node *np,
> const char *name,
> >                             int *lenp);
> >
> > +/**
> > + * of_get_first_property()- get to the pointer of the first property
> > + *
> > + * Get pointer to the first property of the node, it is used to
> > +iterate
> > + * and read all the property with of_get_next_property_by_prop().
> > + *
> > + * @p: Pointer to device node
> 
> np
> 
> > + * @return pointer to property or NULL if not found  */ const struct
> > +property *of_get_first_property(const struct device_node *np);
> > +
> > +/**
> > + * of_get_next_property() - get to the pointer of the next property
> > + *
> > + * Get pointer to the next property of the node, it is used to
> > +iterate
> > + * and read all the property with of_get_property_by_prop().
> > + *
> > + * @p: Pointer to device node
> 
> np
> 
> > + * @property: pointer of the current property
> > + * @return pointer to next property or NULL if not found  */ const
> > +struct property *of_get_next_property(const struct device_node *np,
> > +                                           const struct property
> > +*property);
> > +
> > +/**
> > + * of_get_property_by_prop() - get a property value of a node
> > +property
> > + *
> > + * Get value for the property identified by node and property pointer.
> > + *
> > + * @node: node to read
> > + * @property: pointer of the property to read
> > + * @propname: place to property name on success
> 
> This can be NULL so please document that

ok

> > + * @lenp: place to put length on success
> 
> This can be NULL so please document that
> 
> > + * @return pointer to property value or NULL if error  */ const void
> > +*of_get_property_by_prop(const struct device_node *np,
> > +                                   const struct property *property,
> > +                                   const char **name,
> > +                                   int *lenp);
> > +
> >  /**
> >   * of_device_is_compatible() - Check if the node matches given constraints
> >   * @device: pointer to node
> > diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h index
> > 5c4cbf0998..08d684cea0 100644
> > --- a/include/dm/ofnode.h
> > +++ b/include/dm/ofnode.h
> > @@ -543,7 +543,7 @@ int ofnode_decode_display_timing(ofnode node, int
> index,
> >                                  struct display_timing *config);
> >
> >  /**
> > - * ofnode_get_property()- - get a pointer to the value of a node
> > property
> > + * ofnode_get_property() - get a pointer to the value of a node
> > + property
> >   *
> >   * @node: node to read
> >   * @propname: property to read
> > @@ -552,6 +552,43 @@ int ofnode_decode_display_timing(ofnode node, int
> index,
> >   */
> >  const void *ofnode_get_property(ofnode node, const char *propname,
> > int *lenp);
> >
> > +/**
> > + * ofnode_get_first_property()- get to the pointer of the first
> > +property
> > + *
> > + * Get pointer to the first property of the node, it is used to
> > +iterate
> > + * and read all the property with ofnode_get_property_by_prop().
> > + *
> > + * @node: node to read
> > + * @return pointer or offset to property, used to iterate, or NULL
> > +*/ const void *ofnode_get_first_property(ofnode node);
> > +
> > +/**
> > + * ofnode_get_next_property() - get to the pointer of the next
> > +property
> > + *
> > + * Get pointer to the next property of the node, it is used to
> > +iterate
> > + * and read all the property with ofnode_get_property_by_prop().
> > + *
> > + * @node: node to read
> > + * @property: pointer or offset of the current property
> > + * @return pointer or offset to next property or NULL  */ const void
> > +*ofnode_get_next_property(ofnode node, const void *property);
> > +
> > +/**
> > + * ofnode_get_property_by_prop() - get a pointer to the value of a
> > +node property
> > + *
> > + * Get value for the property identified by node and property.
> > + *
> > + * @node: node to read
> > + * @property: pointer or offset of the property to read
> 
> Perhaps you should define an ofprop type for this? It is pretty ugly to use a pointer.
> 
> In fact I wonder if ofprop should be:
> 
> struct ofprop {
>    ofnode node;
>    union {
>       int offset;
>       struct property *prop;
>    };
> }

Ok, I will do it in v2

The API become:

int ofnode_get_first_property(ofnode node, struct ofprop *prop);
int ofnode_get_next_property(struct ofprop *prop);

same prop is used as input parameter and ouput parameter.

const void *ofnode_get_property_by_prop(struct ofprop *prop,
					const char **propname, int *lenp);

same for dev_ function 


> > + * @propname: place to property name on success
> > + * @lenp: place to put length on success
> 
> These two above can be NULL so please document that

OK

> > + * @return pointer to property or NULL if error  */ const void
> > +*ofnode_get_property_by_prop(ofnode node, const void *property,
> > +                                       const char **propname, int
> > +*lenp);
> > +
> >  /**
> >   * ofnode_is_available() - check if a node is marked available
> >   *
> > --
> > 2.17.1
> >
> 
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
