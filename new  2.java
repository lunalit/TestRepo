import static org.junit.Assert.assertTrue;

String fontWeight = desc.getCssValue("font-Weight");
assertTrue(fontWeight.equals("bold"));